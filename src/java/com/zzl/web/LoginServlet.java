/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zzl.web;

import com.zzl.ejb.User;
import com.zzl.ejb.UserFacade;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.jms.JMSConnectionFactory;
import javax.jms.JMSContext;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thinkpad
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Resource(mappedName = "jms/userQueue")
    private Queue userQueue;// 用户消息队列,存储User实体
    @Inject
    @JMSConnectionFactory("java:comp/DefaultJMSConnectionFactory")
    private JMSContext context;//JMS上下文，发送User实体
    @EJB
    private UserFacade userFacade;//UserFacade，操作数据接口
    // 格式化日期，单例成员变量
    private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 解决响应和请求乱码
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        // 参数获取
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String yzm = request.getParameter("yzm");
        String sessionYzm = (String) request.getSession().getAttribute("sessionYzm");
        // 校验验证码
        if (yzm.equals("") || yzm.trim().length() == 0) {
            // 校验未输入则设置域转发到登录JSP
            request.setAttribute("msg", "请输入验证码");
            System.out.println(request.getAttribute("msg"));
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            if (!yzm.equalsIgnoreCase(sessionYzm)) {
                // 验证码输入错误，设置域转发到登录JSP
                request.setAttribute("msg", "请输入正确验证码");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
        // 数据库查询,根据名字
        List<User> users = userFacade.findAll();
        User loginUser = null;
        for (User user : users) { // 查找指定用户
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                loginUser = user;
                break;
            }
        }
        if (loginUser != null) {
            // 登陆成功，更新用户实体
            int times = loginUser.getLoginTimes() + 1;// 自增登入次数
            String beforeDate = format.format(loginUser.getBeforeDate());
            loginUser.setBeforeDate(new Date());
            loginUser.setLoginTimes(times);
            // 创建及发送消息，修改用户实体
            try {
                ObjectMessage msg = context.createObjectMessage();
                msg.setObject(loginUser);
                sendJMSMessageToUserQueue(msg);
            } catch (Exception exception) {
                exception.printStackTrace();
            }
            // 自动登入 利用Cookie
            String autoLogin = request.getParameter("autoLogin");
            if (autoLogin != null) {
                Cookie cookie = new Cookie("autoLogin", username + "@" + password);
                cookie.setPath("/");
                cookie.setMaxAge(3600);
                response.addCookie(cookie);
            }
            // 设置session域用户页面共享
            HttpSession session = request.getSession(false);
            session.setAttribute("username", username); // 用于欢迎界面展示用户名
            session.setAttribute("loginTimes", times); // 用于欢迎界面展示登录次数
            session.setAttribute("beforeDate", beforeDate); // 用于欢迎界面展示上次登录时间
            request.getRequestDispatcher("/main.jsp").forward(request, response);// 请求转发
        } else {
            // 用户名或密码错误，登录失败
            request.setAttribute("msg", "用户名或者密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);// 请求转发
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void sendJMSMessageToUserQueue(Message messageData) {
        context.createProducer().send(userQueue, messageData);
    }

}

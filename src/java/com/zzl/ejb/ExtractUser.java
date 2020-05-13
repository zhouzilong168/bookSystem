/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zzl.ejb;

import javax.annotation.Resource;
import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.ejb.MessageDrivenContext;
import javax.inject.Inject;
import javax.jms.JMSConnectionFactory;
import javax.jms.JMSContext;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author thinkpad
 */
@MessageDriven(activationConfig = {
    @ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/userQueue")
    ,
        @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue")
})
public class ExtractUser implements MessageListener {

    @Resource(mappedName = "jms/userQueue")
    private MessageDrivenContext mdc;
    @PersistenceContext(unitName = "bookSystemPU")
    private EntityManager em;

    public ExtractUser() {
    }

    @Override
    public void onMessage(Message message) {
        ObjectMessage msg = null;
        try {
            if (message instanceof ObjectMessage) {// 判断是否实体消息
                msg = (ObjectMessage) message;// 类型转换
                User user = (User) msg.getObject();// 获得实体对象
                edit(user);// 实体管理器持久化
            }
        } catch (JMSException e) {
            e.printStackTrace();
            mdc.setRollbackOnly();
        }
    }

    public void persist(Object object) {
        em.persist(object);
    }

    public void edit(Object object) {
        em.merge(object);
    }
}

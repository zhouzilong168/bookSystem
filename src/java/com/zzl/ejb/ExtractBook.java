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
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author thinkpad
 */
@MessageDriven(activationConfig = {
    @ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/bookQueue")
    ,
        @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue")
})
public class ExtractBook implements MessageListener {
    @Resource(mappedName = "jms/bookQueue")
    private MessageDrivenContext mdc;
    @PersistenceContext(unitName = "bookSystemPU")
    private EntityManager em;
    
    public ExtractBook() {
    }
    
    @Override
    public void onMessage(Message message) {
        ObjectMessage msg = null;
        try{
            if(message instanceof ObjectMessage){
                msg = (ObjectMessage) message;
                Book book = (Book) msg.getObject();
                persist(book);
            }
        }catch(JMSException e){
            e.printStackTrace();
            mdc.setRollbackOnly();
        }
    }

    public void persist(Object object) {
        em.persist(object);
    }
    
}

package com.zzl.ejb;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-05-13T16:15:47")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, Integer> loginTimes;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, Date> beforeDate;
    public static volatile SingularAttribute<User, String> username;

}
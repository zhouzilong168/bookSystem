package com.zzl.ejb;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-05-13T16:15:47")
@StaticMetamodel(Book.class)
public class Book_ { 

    public static volatile SingularAttribute<Book, Date> date;
    public static volatile SingularAttribute<Book, String> author;
    public static volatile SingularAttribute<Book, Float> price;
    public static volatile SingularAttribute<Book, String> isbn;
    public static volatile SingularAttribute<Book, String> publisher;
    public static volatile SingularAttribute<Book, Integer> id;
    public static volatile SingularAttribute<Book, String> title;

}
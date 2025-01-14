### General
- [[Spring (Java Framework)]] [[Interfaces (Java)]]
- Spring offers a range of [[Interfaces (Java)]] that allow the [[Bean (Spring)|beans]] to indicate to the [[Inversion of Control (IoC) (Software)|container]] that they require a particular infrastructure dependency. 
- Each of these _Aware_ interfaces will require us to implement a method to inject the dependency in the bean.
- Details in tabular form: https://howtodoinjava.com/spring-core/spring-bean-life-cycle/#5-aware-interfaces-to-add-specific-behavior


| Aware interface                                 | Method to Override               | Purpose                                                                              |
| ----------------------------------------------- | -------------------------------- | ------------------------------------------------------------------------------------ |
| _**[[ApplicationContextAware (Spring)]]**_        | _setApplicationContext()_        | Sets the _ApplicationContext_ that the bean runs in.                                 |
| _**[[ApplicationEventPublisherAware (Spring)]]**_ | _setApplicationEventPublisher()_ | Sets the _ApplicationEventPublisher_ that the bean runs in.                          |
| **_[[BeanNameAware (Spring)]]_**                  | _setBeanName()_                  | Sets the name of the bean in the bean factory.                                       |
| **_[[LoadTimeWeaverAware (Spring)]]_**            | _setLoadTimeWeaver()_            | Sets the _LoadTimeWeaver_ of this object’s containing _ApplicationContext_.          |
| **_[[MessageSourceAware (Spring)]]_**             | _setMessageSource()_             | Sets the _MessageSource_ that this bean runs in.                                     |
| **_[[NotificationPublisherAware (Spring)]]_**     | _setNotificationPublisher()_     | Sets the _NotificationPublisher_ instance for the current managed resource instance. |
| _**[[ResourceLoaderAware (Spring)]]**_            | _setResourceLoader()_            | Sets the _ResourceLoader_ that this object runs in.                                  |
| **_[[ServletContextAware (Spring)]]_**            | _setServletContext()_            | Sets the _ServletContext_ that this object runs in.                                  |

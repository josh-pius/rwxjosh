### General
-  A service interface for type conversion. This is the entry point into the convert system.
 - Call `convert(Object, Class)` to perform a thread-safe type conversion using this system.



### Examples
- A [[Bean (Spring)]] of that type is created in a [[@Configuration (Spring)]] classs
```java
@Bean
public ConversionService webSocketConversionService() {
	GenericConversionService conversionService = new DefaultConversionService();
	conversionService.addConverter(new MyTypeToStringConverter());
	conversionService.addConverter(new MyTypeToBytesConverter());
	conversionService.addConverter(new StringToMyTypeConverter());
	conversionService.addConverter(new BytesToMyTypeConverter());
	return conversionService;
}

```
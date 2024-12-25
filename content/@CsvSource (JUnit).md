### Example
```java
@ParameterizedTest
@CsvSource({
"Managing Your Manager, https://www.safaribooksonline.com/library/view/managing-your-manager/9781492031628/",
"Reactive Spring, https://www.safaribooksonline.com/library/view/reactive-spring/9781492025733/",
"Advanced Java Development, https://www.safaribooksonline.com/library/view/advanced-java-development/9781491960400/",
"Spring Framework Essentials, https://www.safaribooksonline.com/library/view/spring-framework-essentials/9781491942680/",
"Understanding Java 8 Generics, https://www.safaribooksonline.com/library/view/understanding-java-8/9781491978153/"
    })
    void courseList(String title, String url) {
        assertAll(
                () -> assertNotNull(title),
                () -> assertTrue(UrlValidator.getInstance().isValid(url))
        );
    }
```
### General
- A [[Meta-Annotation (Java)]] used to specify the kinds of program elements to which an annotation type can be applied. 
- Restricts where your annotation is allowed to appear
- The various `ElementType` values are
	- TYPE (class, interfaces, enums or annotations)
	- FIELD
	- METHOD
	- PARAMETER
	- CONSTRUCTOR
	- LOCAL_VARIABLE
	- ANNOTATION_TYPE (For meta-annotations)
	- PACKAGE
	- TYPE_PARAMETER
	- TYPE_USE
- Example: Here it can only be used on [[Method (Java)]]s and [[Field (Java)]]
```java
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;

@Target({ElementType.METHOD, ElementType.FIELD})
@interface MyAnnotation {
    String value();
}

```
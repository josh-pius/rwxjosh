### General
- It is a file that specifies the location of user-defined classes and packages

### Specifying ClassPath Manually

- When we invoke Java, we specify the name of the application to run (say `org.mypackage.HelloWorld`). 
- However we must also tell Java where to look for the files and directories defining our package.
- So to launch the program, we use the following command:

```windows
 java -classpath D:\myprogram org.mypackage.HelloWorld
```

```Linux
 java -cp /home/user/myprogram org.mypackage.HelloWorld
```
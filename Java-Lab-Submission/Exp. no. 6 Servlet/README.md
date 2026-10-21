# Java Servlet Experiment

A beginner-friendly B.Tech practical demonstrating Jakarta Servlets, GET/POST requests, request parameters, and HTML responses.

## Requirements

- JDK 17 or newer
- Apache Maven 3.9+
- Apache Tomcat 11 (compatible with Jakarta Servlet 6.1)

> This project uses `jakarta.servlet.*` and is intended for Tomcat 11. It is not intended for Tomcat 9, which uses the older `javax.servlet.*` namespace.

## Project structure

```text
servlet/
├── pom.xml
├── README.md
├── .gitignore
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── servlet/
        │           ├── HelloServlet.java
        │           └── StudentServlet.java
        └── webapp/
            └── index.html
```

## Build the project

Open Command Prompt in this project folder and run:

```bat
mvn clean package
```

If the build succeeds, Maven creates:

```text
target/servlet.war
```

## Run on Tomcat 11

1. Stop Tomcat if it is already running.
2. Copy `target\servlet.war` into Tomcat's `webapps` folder.
3. Start Tomcat using `bin\startup.bat` (or your usual Tomcat start method).
4. Open these URLs in your browser:

- Home page: `http://localhost:8080/servlet/`
- Hello Servlet: `http://localhost:8080/servlet/hello`
- Hello with a parameter: `http://localhost:8080/servlet/hello?name=Jiya`
- Student form: `http://localhost:8080/servlet/student`

If your Tomcat uses a different port, replace `8080` with that port.

## Upload to GitHub

1. Sign in to GitHub and create a new repository, for example `java-servlet-experiment`.
2. Extract this ZIP.
3. Open Command Prompt in the extracted `Servlet_GitHub_Project` folder.
4. Run:

```bat
git init
git add .
git commit -m "Add Java Servlet experiment"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/java-servlet-experiment.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username and use the exact repository URL GitHub gives you. Git must be installed and you must be signed in/authenticated.

## Notes

- Student details are displayed in the response only; this demo does not save them to a database.
- Do not commit passwords, API keys, or other secrets.
- If `mvn` is not recognized, install Maven and configure `PATH`; if Maven reports `JAVA_HOME` is missing, set it to the actual JDK installation directory (not its `bin` directory).

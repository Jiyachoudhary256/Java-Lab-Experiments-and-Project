# HTML to JSP Conversion — Advanced Java Experiment

## Aim
To convert a static HTML page into a JSP page and demonstrate dynamic output using JSP expressions and scriptlets.

## Software requirements
- JDK 17 or later
- Apache Maven
- Apache Tomcat 10.1+
- A browser

## Project structure
```text
HTML_to_JSP_Conversion_Experiment/
├── pom.xml
└── src/main/webapp/
    ├── index.html
    ├── converted.jsp
    └── WEB-INF/web.xml
```

## How to run (Windows)
1. Extract this project ZIP.
2. Open Command Prompt in the extracted project folder (the folder containing `pom.xml`).
3. Check tools:
   ```bat
   java -version
   mvn -version
   ```
4. Build the WAR:
   ```bat
   mvn clean package
   ```
5. Copy `target\HTMLToJSP.war` into Tomcat's `webapps` folder.
6. Start Tomcat using `bin\startup.bat`.
7. Open:
   - `http://localhost:8080/HTMLToJSP/`
   - `http://localhost:8080/HTMLToJSP/converted.jsp`

If Maven is not recognized, install Maven and add its `bin` folder to PATH. Set `JAVA_HOME` to your JDK folder. This project targets Tomcat 10.1+ (Jakarta), not Tomcat 9.

## Experiment / procedure
1. Create a basic static HTML page (`index.html`).
2. Copy its HTML structure into `converted.jsp`.
3. Add JSP directives, declarations/expressions or scriptlets to make selected content dynamic.
4. Build and deploy the WAR file on Tomcat.
5. Open both pages and compare the static and dynamic output.

## Expected result
The HTML page displays fixed content. The JSP page displays similar content plus a server-generated date/time and a personalized greeting based on the `name` request parameter.

## Viva questions
1. What is JSP? — JavaServer Pages is a server-side technology for generating dynamic web pages.
2. How is JSP different from HTML? — HTML is static markup; JSP can generate dynamic content on the server.
3. What is a JSP directive? — An instruction to the JSP container, such as the page directive.
4. What is a JSP expression? — `<%= ... %>` prints the value of an expression in the response.
5. Does the browser execute JSP? — No. The server processes JSP and sends the generated HTML to the browser.

## Note
This is a beginner-friendly educational demonstration. JSP scriptlets are included only to demonstrate the experiment; modern projects generally prefer EL/JSTL and servlets for application logic.

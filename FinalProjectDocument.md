# CSC 455 Group Project Information

Kody Deda, Alex Chisholm, Basam Ahmed

## I. Written overview or summary of the project

For our CSC 455 final project, we decided to create an iOS app for the Myers Briggs Personality Type assessment.  The purpose of our app was to allow users to learn more about themselves and others through taking the assessment and reading information about the different types.

Functionally, our app was written using SwiftUI and a package called SQLite for writing our SQLite queries directly.  We used sql for loading, storing, and comparing information about different personality types and groups.

During development we encountered issues with converting the sql queries into direct Swift code and implementing that into the app.  However, we were able to get the queries and the UI working independently of one another.
  
## II. Final logical E-R diagram

![map](https://user-images.githubusercontent.com/45678211/117189952-ca99f680-adac-11eb-9780-ee6fa000a9a0.png)

## III. Table design, Relationships, & Data

![drawSQL-export-2021-05-05_13_49](https://user-images.githubusercontent.com/45678211/117189923-c1108e80-adac-11eb-84fd-6f27d1c84df5.png)

## IV. Supporting Queries and Functionality

### 1. Two-Table Join

```
SELECT Assessment.assessmentId, Assessment.questionId
FROM Assessment
INNER JOIN Question ON Question.questionId = Assessmet.questionId;
```

### 2. Three-Table Join
```
SELECT Assessment.assessmentId, Assessment.questionId
FROM Assessment
INNER JOIN Question ON Question.questionId = Assessmet.questionId
INNER JOIN PersonalitySpectrum ON PersonalitySpectrum.Id = Question.personalitySpectrumId;
```

### 3. Self-Join
```
SELECT A.questionId as Assessment1, B.questionId as Assessment2
FROM Assessment A, Assessment B
WHERE A.questionId = B.questionId;
```

### 4. Aggregate Function
```
SELECT COUNT(name)
FROM Person;
```

### 5. Aggregate Function using GROUP BY and HAVING
```
SELECT COUNT(name)
FROM Person
GROUP BY assessmentResults;
```

### 6. Text-Based-Search Query using LIKE with wildcard(s)
```
SELECT personId
FROM Person
WHERE CONTAINS("Alice")
```

### 7. Subquery
```
SELECT Assessment.id
(SELECT MAX(Person.assessmentsTaken)
FROM PersonAS) as max_person
FROM Person.assessmentsTaken AS p;
```

### 8. Stored Function
```
CREATE FUNCTION PersonLevel()
  RETURNS VCHAR(15)
  DETERMINISTIC
  BEGIN
      DECLARE personLevel VARCHAR(15);

      IF assessmentsTaken > 10 THEN
          SET personLevel = '3';
      ELSEIF (assessmentsTaken >= 5 AND
                                  assessmentsTaken <= 10) THEN
          SET personLevel = '2';
      ELSEIF assessmentsTaken < 10 THEN
          SET personLevel = '1';
      END IF;
      RETURN (personLevel);
  END$$
```

### 9. Stored Procedure
```
CREATE PROCEDURE setPersonName
AS
UPDATE Person
SET Person.name = new_name
where Person.name = old_name;
```

### 10. Trigger
```
create trigger assessment_count
before INSERT
on
Assessment
UPDATE Assessment.Count = Assessment.Count + 1;
```

## V. A simple, web-based front-end providing links to the appropriate queries

N/A see above

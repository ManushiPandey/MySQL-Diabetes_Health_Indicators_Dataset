-- Create the Users table
CREATE TABLE Users (
    respondent_id INT PRIMARY KEY NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    income INT,
    education VARCHAR(50),
    race VARCHAR(50),
    employment_status VARCHAR(50)
);

-- Create the Health Indicators table
CREATE TABLE Health_Indicators (
    indicator_id INT PRIMARY KEY NOT NULL,
    respondent_id INT NOT NULL,
    bmi FLOAT,
    physical_activity BOOLEAN,
    smoking_status BOOLEAN,
    alcohol_consumption BOOLEAN,
    general_health INT,
    mental_health INT,
    physical_health INT,
    FOREIGN KEY (respondent_id) REFERENCES Users(respondent_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Create the Diabetes Risk table
CREATE TABLE Diabetes_Risk (
    risk_id INT PRIMARY KEY NOT NULL,
    respondent_id INT NOT NULL,
    diabetes_binary BOOLEAN NOT NULL,
    diabetes_012 INT NOT NULL,
    FOREIGN KEY (respondent_id) REFERENCES Users(respondent_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

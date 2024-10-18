CREATE DATABASE aquademy;
USE aquademy;

CREATE TABLE projects (
  ProjectID INT PRIMARY KEY AUTO_INCREMENT,
  ProjectName VARCHAR(255),			 
  Location VARCHAR(255),			 -- Where a project resides
  Capacity DECIMAL(10, 2) NOT NULL,  -- Max energy input
  Type VARCHAR(100) NOT NULL,        -- Type of technology in use
  Status VARCHAR(50),                -- Completion status
  CompletionDate DATE,                -- Date of completion
  CustomerID INT,                    -- Foreign key referencing customers table
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
	);

CREATE TABLE developers (
  DeveloperID INT PRIMARY KEY AUTO_INCREMENT,
  DeveloperName VARCHAR(255) NOT NULL,
  ContactInformation VARCHAR(255),	   
  ProjectsManaged INT,                 -- Number of projects managed
  MarketShare DECIMAL(5, 2)            -- Market share percentage
	);

CREATE TABLE environment_impact_study (
  StudyID INT PRIMARY KEY AUTO_INCREMENT,
  ProjectID INT NOT NULL,			  
  Location VARCHAR(255) NOT NULL,	  -- Where a study resides
  Description TEXT,					  -- Short synopsis of a study
  ImpactAssessment TEXT,			  -- Environmental impact post implimentation
  Recommendations TEXT,				  -- Insights and omens for the future
  FOREIGN KEY (ProjectID) REFERENCES projects(ProjectID) 
	);

CREATE TABLE finances (
  FinanceID INT PRIMARY KEY AUTO_INCREMENT,  
  ProjectID INT NOT NULL,
  InitialInvestment DECIMAL(15, 2) NOT NULL,   -- Project cost pre implemintation 
  OperationalCosts DECIMAL(15, 2) NOT NULL,	   -- Net maintanence and operation costs
  Revenue DECIMAL(15, 2) NOT NULL,			   -- Gross income from projects
  FundingSources TEXT,						   -- Where funds came from
  FOREIGN KEY (ProjectID) REFERENCES projects(ProjectID)
	);

CREATE TABLE trends (
  TrendID INT PRIMARY KEY AUTO_INCREMENT,
  Year INT NOT NULL,					-- Year the trend resides within
  MarketSize DECIMAL(15, 2) NOT NULL,   -- Value/capacity of the market
  GrowthRate DECIMAL(5, 2) NOT NULL,    -- Percentage since launch
  Drivers TEXT                          -- Key market drivers
	);

CREATE TABLE customers (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerName VARCHAR(255) NOT NULL,
  Region VARCHAR(100) NOT NULL,			 -- Where a customer resides regionally
  CustomerDate DATE NOT NULL,            -- Date of data entry or reporting
  EnergyDemand DECIMAL(15, 2) NOT NULL   -- How much energy is being requested
	);

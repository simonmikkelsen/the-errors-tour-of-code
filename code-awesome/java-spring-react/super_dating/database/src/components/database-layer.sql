-- Database Layer for Super Dating App

-- Table: Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Profiles
CREATE TABLE Profiles (
    ProfileID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    Bio TEXT,
    Location VARCHAR(255),
    Interests TEXT,
    PhotoURL VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table: Matches
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY AUTO_INCREMENT,
    User1ID INT NOT NULL,
    User2ID INT NOT NULL,
    MatchDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pending', 'Accepted', 'Rejected'),
    FOREIGN KEY (User1ID) REFERENCES Users(UserID),
    FOREIGN KEY (User2ID) REFERENCES Users(UserID),
    UNIQUE KEY unique_match (User1ID, User2ID)
);

-- Table: Messages
CREATE TABLE Messages (
    MessageID INT PRIMARY KEY AUTO_INCREMENT,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    MessageText TEXT NOT NULL,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

-- Table: Interests
CREATE TABLE Interests (
    InterestID INT PRIMARY KEY AUTO_INCREMENT,
    InterestName VARCHAR(255) NOT NULL
);

-- Table: UserInterests
CREATE TABLE UserInterests (
    UserID INT NOT NULL,
    InterestID INT NOT NULL,
    PRIMARY KEY (UserID, InterestID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (InterestID) REFERENCES Interests(InterestID)
);

-- Table: Events
CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(255) NOT NULL,
    Description TEXT,
    Location VARCHAR(255),
    Date DATETIME NOT NULL,
    OrganizerID INT NOT NULL,
    FOREIGN KEY (OrganizerID) REFERENCES Users(UserID)
);

-- Table: EventAttendees
CREATE TABLE EventAttendees (
    EventID INT NOT NULL,
    AttendeeID INT NOT NULL,
    AttendanceStatus ENUM('Attending', 'RSVP', 'Not Attending'),
    PRIMARY KEY (EventID, AttendeeID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES Users(UserID)
);

-- Index for faster queries
CREATE INDEX idx_users_username ON Users(Username);
CREATE INDEX idx_profiles_userid ON Profiles(UserID);
CREATE INDEX idx_matches_user1id ON Matches(User1ID);
CREATE INDEX idx_messages_userid ON Messages(UserID);
CREATE INDEX idx_eventattendees_eventid ON EventAttendees(EventID);
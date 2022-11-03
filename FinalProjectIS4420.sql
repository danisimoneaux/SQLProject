#Database Creation
DROP DATABASE IF EXISTS final_project_4;
CREATE DATABASE final_project_4;
use final_project_4;

#Department Table
Drop table if exists Department;
Create table Department
(DeptID Int Not Null,
DeptName Varchar(40),
Constraint PK_Dept_DeptID Primary Key (DeptID)
);

#Moderator Table
Drop table if exists Moderator;
Create table Moderator
(ModeratorID Int Not Null,
DeptID Int Not Null,
MFirstName Varchar(40) Not Null,
MLastName Varchar(40) Not Null,
Constraint PK_Moderator_ModeratorID Primary Key (ModeratorID),
Constraint FK_Moderator_DeptID Foreign Key (DeptID) References Department (DeptID)
);

#Category Table
Drop table if exists FoodCategory;
Create table FoodCategory
(CategoryID Int Not Null,
CategoryName VARCHAR(40) Not Null,
Constraint PK_FoodCategory_CategoryID Primary Key (CategoryID)
);

#Restaurant Profile Table
Drop table if exists RestProfile;
Create table RestProfile
(RestProfileID Int Not Null,
MenuInput VARCHAR(500) Not Null,
Constraint PK_RestProfile_RestProfileID Primary Key (RestProfileID)
);

#Rest Item
Drop Table if exists RestItem;
Create Table RestItem
(RestItemID Int Not Null,
RestProfileID Int Not Null,
ItemName Varchar(500) Not Null,
ItemDescription Varchar(500) Not Null,
Constraint PK_RestItem_RestItemID Primary Key (RestItemID),
Constraint FK_RestItem_RestProfileID Foreign Key (RestProfileID) References RestProfile (RestProfileID)
);

#Food Eatery Table 
Drop table if exists Rest;
Create Table Rest
(RestID Int Not Null Auto_Increment,
ModeratorID Int NOT NULL,
RestProfileID Int Not Null,
RestName VARCHAR(250) Not Null,
CategoryID Int Not Null,
CardInfo VARCHAR(20) Default Null,
Constraint PK_Rest_RestID Primary Key (RestID),
Constraint FK_Rest_CategoryID Foreign Key (CategoryID) References FoodCategory (CategoryID),
Constraint FK_Rest_ModeratorID Foreign Key (ModeratorID) References Moderator (ModeratorID),
Constraint FK_Rest_RestProfileID Foreign Key (RestProfileID) References RestProfile (RestProfileID)
);

#Subscription Table
Drop table if exists PremSub;
Create Table PremSub
(SubscriptionID Int Not Null,
RestID Int Not Null,
Price Decimal(5,2) Default Null,
Constraint PK_PremSub_SubscriptionID Primary Key (SubscriptionID),
Constraint FK_PremSub_RestaurantID Foreign Key (RestID) References Rest (RestID)
);

#User Table
Drop table if exists Userx;
Create table Userx
(UserID Int Not Null,
ModeratorID Int Not Null,
FirstName VARCHAR(20) Not Null,
LastName VARCHAR(20) Not Null,
Gender CHAR(2) Not Null,
StarSign VARCHAR(15) Default Null,
City VARCHAR(25) Not Null,
State VARCHAR(25) Not Null,
Age Int Not Null,
Constraint PK_Userx_UserID Primary Key (UserID),
Constraint FK_Userx_ModeratorID Foreign Key (ModeratorID) references Moderator (ModeratorID)
);

#UserProfile Table
Drop table if exists UserProfile;
Create table UserProfile
(Username CHAR(20) Not Null,
UserID Int Not Null,
Constraint PK_UserProfile_Username_UserID Primary Key (Username,UserID),
Constraint FK_UserProfile_UserID Foreign Key (UserID) References Userx (UserID)
);

Drop table if exists Follow;
Create table Followership
(FollowID Int Not Null,
RestProfileID Int Not Null,
Username Char(20) Not Null,
Constraint PK_Follow_FollowID_RestProfile Primary Key (FollowID,RestProfileID),
Constraint FK_Follow_RestProfile Foreign Key (RestProfileID) References RestProfile (RestProfileID),
Constraint FK_Follow_Username Foreign Key (Username) References UserProfile (Username)
);

#RatingTable
Drop table if exists Rating;
Create table Rating
(RatingID Int Not Null,
RatingScore Decimal(3,2) Not Null,
Constraint PK_Ratings_RatingID Primary Key (RatingID)
);

#Post Table
Drop table if exists Post;
Create table Post
(PostID Int Not Null,
ModeratorID Int Not Null,
Username CHAR(20) Not Null,
RestProfileID Int Not Null,
RatingID Int Not Null,
Constraint PK_Post_PostID Primary Key (PostID),
Constraint FK_Post_ModeratorID Foreign Key (ModeratorID) References Moderator (ModeratorID),
Constraint FK_Post_Username Foreign Key (Username) References UserProfile (Username),
Constraint FK_Post_RestProfileID Foreign Key (RestProfileID) References RestProfile (RestProfileID),
Constraint FK_Post_RatingID Foreign Key (RatingID) References Rating (RatingID)
);





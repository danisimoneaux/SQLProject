#1
SELECT COUNT(p.PostID)/ COUNT(u.UserID) AS 'Average Posts by User'
FROM Post AS p
JOIN UserProfile AS up 
	ON p.Username = up.Username
JOIN Userx AS u 
ON u.UserId = up.UserID;

#2
SELECT AVG(r.RatingScore) AS 'Average Score'
FROM Rating AS r;
    
#3
SELECT re.RestName AS Restuarant,
		AVG(r.RatingScore) AS Score
FROM Rest AS re
JOIN Post AS p 
	ON p.RestProfileID=re.RestProfileID
JOIN Rating AS r 
	ON r.RatingID = p.RatingID
GROUP BY Restuarant
ORDER BY Score DESC
LIMIT 5;

#4
SELECT fc.CategoryName AS Category,
		COUNT(f.FollowID) AS Followers
FROM FoodCategory AS fc
JOIN Rest AS r
	ON fc.CategoryID = r.CategoryID
JOIN RestProfile AS rp
	ON r.RestProfileID = rp.RestProfileID
JOIN Followership AS f
	ON rp.RestProfileID = f.RestProfileID
GROUP BY fc.CategoryName
ORDER BY Followers DESC
LIMIT 5;

#5
SELECT AVG(age) AS 'Average Age' FROM userx;

#6
SELECT Sum(ps.Price) AS 'Monthly Revenue'
FROM PremSub AS ps;

#7
SELECT r.RestName AS Restaurant, 
		COUNT(p.PostID) AS Reviews
FROM Rest AS r
JOIN RestProfile AS rp
	ON r.RestProfileID = rp.RestProfileID
JOIN Post AS p
	ON p.RestProfileID = rp.RestProfileID
GROUP BY Restaurant
ORDER BY Reviews DESC
LIMIT 5;

#8
SELECT r.RestName as Restaurant, 
COUNT(f.FollowID) AS Followers
FROM rest AS r 
JOIN restprofile AS rp
	ON r.RestProfileID = rp.RestProfileID
JOIN followership AS f 
	ON rp.RestProfileID = f.RestProfileID
GROUP BY r.RestName
ORDER BY Followers DESC;

#9
SELECT Userx.Gender AS Gender, 
		COUNT(Post.RatingID) AS 'Number of Reviews'
FROM UserProfile 
JOIN Userx 
	ON Userx.UserID=UserProfile.UserID
JOIN Post 
	ON UserProfile.Username=Post.Username
GROUP BY Userx.Gender
ORDER BY 'Number of Reviews' DESC;

#10 What are the highest rated Resuarants by cateogry
SELECT fc.CategoryName AS Category,
		AVG(ra.RatingScore) AS Score
FROM Rest AS r
LEFT JOIN FoodCategory AS fc
	ON r.CategoryID=fc.CategoryID
LEFT JOIN RestProfile AS rp
	ON r.RestProfileID = rp.RestProfileID
LEFT JOIN Post AS p
	ON rp.RestProfileID = p.RestProfileID
LEFT JOIN Rating AS ra
	ON p.RatingID = ra.RatingID
GROUP BY Category
ORDER BY Score DESC
;

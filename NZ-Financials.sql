--Total Customer Revenue
SELECT		s.CustomerIndex, c.CustomerNames, SUM(TotalRevenue) as TotalRevenue
FROM		Sales s
JOIN		Customers c 
ON			s.CustomerIndex = c.CustomerIndex
GROUP BY	s.CustomerIndex, c.CustomerNames
ORDER BY	CustomerIndex 

--Total Transactions 
SELECT		COUNT(*) as TotalSalesTransactions 
FROM		Sales

--Average Weekly Ship Time
SELECT		AVG(DATEDIFF(WEEK, OrderDate, ShipDate)) as AvgShipTime 
FROM		Sales 

--Top 5 Products by Revenue
SELECT		TOP(5) ProductIndex, p.ProductName, SUM(TotalRevenue) as TotalRevenue 
FROM		Sales s 
JOIN		Products p
ON			s.ProductIndex = p.[Index]
GROUP BY	ProductIndex, p.ProductName
ORDER BY	TotalRevenue DESC

--Top 5 Suburbs by Revenue
SELECT		TOP(5) s.DeliveryRegionIndex, Suburb, SUM(TotalRevenue) as TotalRevenue
FROM		Sales s 
JOIN		Regions r 
ON			s.DeliveryRegionIndex = r.[Index]
GROUP BY	s.DeliveryRegionIndex, Suburb
ORDER BY	TotalRevenue DESC

--Top 5 Customers by Revenue
SELECT		TOP(5) s.CustomerIndex, CustomerNames, SUM(TotalRevenue) as TotalRevenue
FROM		Sales s
JOIN		Customers c
ON			s.CustomerIndex = c.CustomerIndex
GROUP BY	s.CustomerIndex, CustomerNames
ORDER BY	TotalRevenue DESC

--Total Profit
SELECT		ROUND(SUM(TotalRevenue)-SUM(TotalUnitCost), 2) as TotalProfit 
FROM		Sales

--Total Revenue
SELECT		SUM(TotalRevenue) as TotalRevenue
FROM		Sales
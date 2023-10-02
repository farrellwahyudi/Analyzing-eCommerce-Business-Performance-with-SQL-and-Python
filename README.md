# Analyzing eCommerce Business Performance with SQL and Python

<img src="https://www.webtiks.com/wp-content/uploads/2020/07/ecommerce-website-development-company-in-kolkata.png" alt="eCommerce" style="width:600px;height:500px;">

In the dynamic landscape of corporate operations, 
the meticulous measurement and assessment of business performance stand as essential pillars to ensure the sustained success and refinement of diverse business processes. 
The ever-evolving digital sphere has given rise to eCommerce companies that thrive on a global scale, making their performance analysis all the more critical. 
In light of this, our project embarks on a comprehensive exploration of business performance, with a specific focus on an eCommerce entity. 
Our mission is to delve deep into the intricacies of this digital commerce realm, meticulously scrutinizing various facets, including customer growth, 
product quality, and payment methodologies. Through this multifaceted analysis, we aim to unearth valuable insights that will not only illuminate the current state of affairs but also pave the way for 
informed strategies, fostering growth and resilience in an ever-competitive market.

As we navigate the expansive terrain of eCommerce, we recognize the pivotal role played by these core business metrics. 
Customer growth, the lifeblood of any eCommerce enterprise, serves as a barometer of market acceptance and brand loyalty. 
Meanwhile, the quality of products offered is a critical determinant of customer satisfaction and long-term business sustainability. 
Equally important is the choice of payment methods, which can significantly influence transaction completion rates and customer trust. 
By engaging in this holistic performance analysis, we endeavor to provide a comprehensive view of the eCommerce business's strengths and areas of improvement. 
Through data-driven insights and meticulous assessment, we aim to empower our client with the knowledge necessary to make strategic decisions that will drive their continued success in the digital marketplace.

Data preparation and processing in this project was done with PostgreSQL while the visualizations were done using Python.

## Points to Analyze
This project looks at and focuses on the following:
- **Customer Activity:** how customer activity and by extension customer orders grew over time
- **Product Category Quality:** how product category quality varies by time
- **Payment Type:** which payment types are most used and when

## Data Preparation
A local database was created using PostgreSQL to contain the data. 8 Tables were then created within the database containing data from 8 .csv files to be cleaned and prepared for analysis. 
Entity relationships were also established between the 8 tables ensuring integrity within the database. The final tables to be processed and analyzed along with their relationships 
can be seen in the entity relationship diagram below:

<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/erd.png" alt="erd" style="width:600px;height:600px;">

## Analysis

### Customer Activity

<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/master_table_customer_activity.png" alt="master_table_customer_activity" style="width:650px;height:75px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Master Table of Customer Activity</b>
<br><br>

**1. Average Monthly Active Users:**

In 2016, the platform had an average of approximately 27 active users per month. This suggests that the platform had relatively low user engagement during this year.
In 2017, there was a significant increase in average monthly active users, reaching around 3,643 users per month. This shows substantial growth in user engagement and suggests that the platform became more popular.
In 2018, the trend of increasing user engagement continued, with an average of approximately 4,396 active users per month. This growth in user activity could be due to various factors, such as marketing efforts, product improvements, or a growing customer base.

**2. Number of New Customers:**

In 2016, the platform acquired 326 new customers. This is a relatively modest number and may indicate a slow start for the business during that year.
In 2017, there was a significant surge in new customer acquisition, with 43,708 new customers joining the platform. This suggests a successful marketing strategy or increased brand awareness.
The growth trend continued in 2018, with 52,062 new customers added. This indicates sustained growth and a healthy influx of new users.

**3. Number of Customers with Repeat Orders:**

In 2016, only 3 customers made repeat orders. This is a very low number and may indicate a need for improving customer retention strategies.
In 2017, the number of customers with repeat orders increased significantly to 1,256. This is a positive sign as it indicates that a larger portion of the customer base returned for additional purchases.
In 2018, the platform maintained a good number of customers making repeat orders, with 1,157 customers. This suggests that customer retention efforts were successful.

**4. Average Number of Orders per Customer:**

In 2016, the average customer placed just over one order (approximately 1.009). This indicates that customers were making limited purchases on average.
In 2017, the average number of orders per customer increased slightly to 1.031. While the increase is not significant, it shows that customers were slightly more engaged and made repeat purchases.
In 2018, the average number of orders per customer remained relatively stable at 1.023. This suggests that customers continued to make repeat purchases at a similar rate.

<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/customer_activity_visualization.png" alt="customer_activity_visualization" style="width:850px;height:600px;">

**Overall Insights:**

The platform experienced substantial growth in terms of both active users and new customer acquisition from 2016 to 2018.
The growth in the number of customers making repeat orders indicates an improving customer retention strategy.
While the average number of orders per customer remained relatively stable, it's important to focus on increasing customer engagement and encouraging more frequent purchases.

To continue the growth trend, the business should consider strategies to convert more active users into customers and encourage repeat orders. It's essential to monitor these metrics regularly and adapt strategies accordingly to sustain and further improve customer activity.

### Product Category Quality

<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/master_table_product_category_quality.png" alt="master_table_product_category_quality" style="width:800px;height:75px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Master Table of Product Category Quality</b>
<br><br>

**1. Total Revenue Growth:**

The total revenue of the eCommerce platform has been steadily increasing over the years. It grew from $46,653.74 in 2016 to $6,921,535.24 in 2017, and then to $8,451,584.77 in 2018.
This indicates strong revenue growth and suggests that the business is expanding and attracting more customers.

**2. Total Canceled Orders:**

The total number of canceled orders also increased from 26 in 2016 to 265 in 2017 and 334 in 2018.
While revenue is growing, the increase in canceled orders may indicate that customer satisfaction and order fulfillment could be areas of concern that need attention.

**3. Highest Revenue Product Category:**

In 2016, the highest revenue product category was "Furniture & Decor" with $6,899.35 in revenue.
In 2017 and 2018, the highest revenue product category was "Bed & Bath Table" and "Health & Beauty," respectively.
Each year, different product categories contributed to the platform's revenue.
In 2017, "Bed & Bath Table" contributed significantly with $580,949.20 in revenue, while in 2018, "Health & Beauty" took the lead with $866,810.34.

**4. Most Canceled Product Category:**

The product category with the highest number of canceled orders was "Toys" in 2016, "Sports & Leisure" in 2017, and "Health & Beauty" in 2018.
The number of canceled orders of most canceled categories  grew at a somewhat similar rate to the other categories as a whole from 2016 to 2018.
In 2018, "Health & Beauty" became both the biggest contributor to revenue and the biggest contributor to canceled orders, this could be normal as products from said category is probably the most ordered.

<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/product_category_quality_visualization.png" alt="product_category_quality_visualization" style="width:900px;height:600px;">

**Overall insights:**

The eCommerce platform is experiencing strong revenue growth but also faces challenges related to canceled orders. 
With that being said, revenue growth still outpaces cancellation growth by a factor of around 10, indicating that the increase in cancellation may be normal and collateral in nature.

To further improve the platform's performance, it is crucial to focus on customer satisfaction, identify and address issues in high-cancellation product categories, and continue to capitalize on the categories that are driving revenue growth. Regular monitoring and analysis of such metrics are essential for making informed business decisions and optimizing the eCommerce platform's performance.

### Payment Type Usage
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/table1_payment_type.png" alt="table1_payment_type" style="width:250px;height:175px;">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>All Time Usage Table</b>
<br><br>

<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/table2_payment_type.png" alt="table2_payment_type" style="width:800px;height:125px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Usage by Year Table</b>
<br><br>

**1. Payment Type Distribution:**

The most frequently used payment type is "credit_card" with 76,795 usages, followed by "boleto" with 19,784 usages.
"voucher" and "debit_card" are also used, but to a lesser extent, with 5,775 and 1,529 usages, respectively.
There are only 3 instances where the payment type is "not_defined."

**2. Yearly Payment Type Usage:**

In 2016, "credit_card" was the most popular payment type with 258 usages.
In 2017 and 2018, "credit_card" continued to be the dominant payment type with a significant increase to 34,568 and 41,969 usages, respectively.
"Boleto" and "voucher" also saw increases in usage over the years.
"Debit_card" had a relatively low usage in all three years, but it increased in 2018.
Instances where the payment type is "Not_defined" only occurred in 2018.

**3. Payment Type Trends:**

The data shows a clear trend of increasing usage of "credit_card" as the preferred payment type, indicating that customers have a strong preference for this payment method.
"Boleto" and "voucher" are also used but to a much lesser extent compared to credit cards.
"Debit_card" has a lower usage, but showing a slight increase in 2018.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/payment_type_visualization1.png" alt="payment_type_visualization1" style="width:600px;height:350px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>All Time Usage Share</b>

<br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/farrellwahyudi/Analyzing-eCommerce-Business-Performance-with-SQL-and-Python/blob/main/Images/payment_type_visualization2.png" alt="payment_type_visualization2" style="width:500px;height:400px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Payment Type Usage by Year</b>
<br></br>

**Overall Insights:**

Overall, the analysis of these payment type metrics suggests that "credit_card" is the dominant and preferred payment method on the eCommerce platform. The platform should continue to support and promote this payment type. Additionally, monitoring and understanding customer payment preferences can help the business make informed decisions regarding payment processing and optimization.
The data also indicates that only 3 times was the payment type "not_defined", which may require investigation to ensure that customers have a smooth payment experience and that there are no issues with undefined payment types.

## Conclusions & Recommendations

In conclusion, our comprehensive analysis of the eCommerce business performance has provided valuable insights into key facets such as customer activity, product category quality, and payment type usage. 
These insights are crucial in guiding strategic decisions that will shape the future of the eCommerce platform. From our examination, it's evident that the platform has experienced significant growth in 
customer engagement, with a notable increase in both active users and new customer acquisitions over the years. However, to maintain this positive trajectory, 
there's a clear need to focus on converting active users into customers and encouraging repeat purchases. Strategies for enhancing customer engagement and retention should be at the forefront of the 
platform's business objectives. Moreover, as revenue continues to surge, it is vital to address challenges related to canceled orders, prioritize customer satisfaction, and optimize performance 
in high-cancellation product categories. This holistic approach will ensure that the eCommerce platform not only sustains its growth but also thrives in the competitive digital marketplace.

Furthermore, the dominance of "credit_card" as the preferred payment method underscores the importance of supporting and promoting this payment type to meet customer preferences effectively. 
While "boleto" and "voucher" maintain their significance, monitoring and understanding customer payment preferences will be instrumental in making informed decisions regarding payment processing and optimization.
Additionally, the occurrences of "not_defined" payment types warrant careful investigation to ensure a seamless and issue-free payment experience for customers. 
In essence, our analysis not only sheds light on past performance but also lays the foundation for data-driven strategies that will continue to drive success and resilience for the 
eCommerce platform in the dynamic digital landscape. It is imperative for the platform to regularly monitor these metrics, adapt strategies accordingly, and stay committed to customer-centric practices 
to maintain its competitive edge and excel in the evolving eCommerce ecosystem.

<img src="https://inbase.in/img/eco1.gif" alt="ecommerce gif" style="width:600px;height:500px;" loop=infinite>

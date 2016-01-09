---
title: "Reproducible Research: Peer Assessment 1"
output: 
  html_document:
    keep_md: true
---


## Loading and preprocessing the data


```r
data <- read.csv("activity.csv") #read in the data
data_complete <- data[complete.cases(data),] #remove NA values
```

## What is mean total number of steps taken per day?


```r
daily_steps <- aggregate(steps ~ date, data_complete, sum) #use aggregate function to calculate total number of steps per day
hist(daily_steps$steps, main="Total number of steps per day", xlab="Steps per day") #create histogram
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png) 

```r
summary(daily_steps)
```

```
##          date        steps      
##  10/10/2012: 1   Min.   :   41  
##  10/11/2012: 1   1st Qu.: 8841  
##  10/12/2012: 1   Median :10765  
##  10/13/2012: 1   Mean   :10766  
##  10/14/2012: 1   3rd Qu.:13294  
##  10/15/2012: 1   Max.   :21194  
##  (Other)   :47
```

## What is the average daily activity pattern?


```r
interval_steps <- aggregate(steps ~ interval, data_complete, mean) #use aggregate function to calculate the mean number of steps per interval
plot(interval_steps$interval, interval_steps$steps, type="l", main="Average number of steps", xlab="Intervals", ylab="Average number of steps") #make plot
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 

```r
interval_max <- which.max(interval_steps$steps) #find the row with the maximum number of steps
interval_steps[interval_max ,] #find the interval with the maximum number of steps
```

```
##     interval    steps
## 104      835 206.1698
```

## Imputing missing values


```r
missing_data <- data[!complete.cases(data),] #find NA values
nrow(missing_data) #use nrow to find number of missing values
```

```
## [1] 2304
```

```r
data_input <- data
for (i in 1:nrow(data)) { 
if (is.na(data$steps[i])) { #loop through to find missing data and replace
interval_value <- data_input$interval[i]
steps_value <- interval_steps[interval_steps$interval == interval_value,]
data_input$steps[i] <- steps_value$steps
}
}
daily_steps_input <- aggregate(steps ~ date, data_input, sum) #go through the same process as above, but with the input data
hist(daily_steps_input$steps, main="Total number of steps per day (added data)", xlab="Steps per day")
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png) 

```r
summary(daily_steps_input)
```

```
##          date        steps      
##  10/1/2012 : 1   Min.   :   41  
##  10/10/2012: 1   1st Qu.: 9819  
##  10/11/2012: 1   Median :10766  
##  10/12/2012: 1   Mean   :10766  
##  10/13/2012: 1   3rd Qu.:12811  
##  10/14/2012: 1   Max.   :21194  
##  (Other)   :55
```

## Are there differences in activity patterns between weekdays and weekends?


```r
data_input["day"] <- weekdays(as.Date(data_input$date)) #add a column and categorize dates as either weekends or weekdays
data_input$day[data_input$day %in% c("Saturday", "Sunday")] <- "weekend"
data_input$day[data_input$day != "weekend"] <- "weekday"
data_input$day <- as.factor(data_input$day)
data_input_intervals <- aggregate(steps ~ interval + day, data_input, mean) #same aggregate function again
qplot(interval, steps, data=data_input_intervals, type="l", geom=c("line"), xlab="Intervals", ylab="Number of steps") + 
facet_wrap(~day) #use qplot to show this data compared by weekday vs. weekend
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) 

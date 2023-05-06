#grammar of graphics
library(ggplot2)
library(data.table)
df <- fread('state_real_estate_data.csv')
head(df)
tail(df)
str(df)
summary(df)
hist(df[['Home.Value']])
qplot(df[['Home.Value']])
ggplot(data = df,aes(df$Home.Value))+geom_histogram()
#example = qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)
qplot(data=df,x=Home.Value,geom = 'histogram',xlim=c(0,500000), color='red')
#Histograms
#install.packages('ggplot2movies')
library(ggplot2movies)
dfm <- movies <- movies[sample(nrow(movies), 1000), ]
head(dfm)
qplot(rating,data=dfm,geom='histogram',binwidth=0.1,alpha=0.8)
# ggplot(data, aesthetics)
pl <- ggplot(df,aes(x=rating))
pl
# Add Histogram Geometry
pl + geom_histogram()
#adding color
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink')
#adding labels
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink') + xlab('Movie Ratings')+ ylab('Occurences') + ggtitle(' Movie Ratings')
#change transparency
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,fill='blue',alpha=0.4) + xlab('Movie Ratings')+ ylab('Occurences')
#change linetypes
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='blue',fill='pink',linetype='dotted') + xlab('Movie Ratings')+ ylab('Occurences')
# Adding aes functions
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,aes(fill=..count..)) + xlab('Movie Ratings')+ ylab('Occurences')
pl <- ggplot(df,aes(x=rating))
pl2 <- pl + geom_histogram(binwidth=0.1,aes(fill=..count..)) + xlab('Movie Ratings')+ ylab('Occurences')
# scale_fill_gradient('Label',low=color1,high=color2)
pl2 + scale_fill_gradient('Count',low='blue',high='red')
# scale_fill_gradient('Label',low=color1,high=color2)
pl2 + scale_fill_gradient('Count',low='darkgreen',high='lightblue')
# Adding Labels
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(aes(y=..density..)) + geom_density(color='red')
#scatterplots
library('ggplot2')
df <- mtcars
head(df)
qplot(wt,mpg,data=df)
qplot(wt,mpg,data=df,color=cyl)
qplot(wt,mpg,data=df,size=cyl)
qplot(wt,mpg,data=df,size=cyl,color=cyl)
# Show 4 features (this gets messy)
qplot(wt,mpg,data=df,size=cyl,color=hp,alpha=0.6)
pl <- ggplot(data=df,aes(x = wt,y=mpg)) 
pl + geom_point()
pl <- ggplot(data=df,aes(x = wt,y=mpg)) 
pl + geom_point(aes(color=cyl))
pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(color=factor(cyl)))
pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(size=factor(cyl)))
# With Shapes
pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(shape=factor(cyl)))
# Better version with Shapes
pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(shape=factor(cyl),color=factor(cyl)),size=4,alpha=0.6)
#gradient scales
pl + geom_point(aes(colour = hp),size=4) + scale_colour_gradient(high='red',low = "blue")
#barplots
library(ggplot2)
# counts (or sums of weights)
g <- ggplot(mpg, aes(class))
# Number of cars in each class:
g + geom_bar()
# Bar charts are automatically stacked when multiple bars are placed at the same location
g + geom_bar(aes(fill = drv))
g + geom_bar(aes(fill = drv), position = "fill")
# You can instead dodge, or fill them
g + geom_bar(aes(fill = drv), position = "dodge")
#boxplots
library(ggplot2)
df <- mtcars
head(df)
qplot(factor(cyl), mpg, data = mtcars, geom = "boxplot")
pl <- ggplot(mtcars, aes(factor(cyl), mpg))
pl + geom_boxplot()
pl + geom_boxplot() + coord_flip()
pl + geom_boxplot(aes(fill = factor(cyl)))
pl + geom_boxplot(fill = "grey", color = "blue")
#2 variable plotting
library(ggplot2)
df <- movies
qplot(x=year, y=rating, data = df, geom = "density2d")
pl <- ggplot(movies,aes(x = year,y=rating))
pl + geom_bin2d()
# Control bin sizes
pl + geom_bin2d(binwidth=c(2,1))
pl + geom_density2d()
pl + geom_hex()
pl + geom_hex() + scale_fill_gradient(high='red',low='blue')
#Coordinates and Faceting
library(ggplot2)
pl <- ggplot(mpg,aes(x=displ,y=hwy)) + geom_point()
pl
pl + coord_cartesian(xlim=c(1,4),ylim=c(15,30))
# aspect ratio, expressed as y / x
pl + coord_fixed(ratio = 1/3)
help(facet_grid)
p <- ggplot(mpg, aes(displ, cty)) + geom_point()
p + facet_grid(. ~ cyl)
p + facet_grid(drv ~ .)
p + facet_grid(drv ~ cyl)
#themes
library(ggplot2)
df <- mtcars
head(df)
pl <- ggplot(df,aes(x=mpg,y=hp)) + geom_point()
print(pl)
pl + theme_bw()
pl + theme_classic()
pl + theme_dark()
pl + theme_get()
pl + theme_light()
pl + theme_linedraw()
pl + theme_minimal()
pl + theme_void()
install.packages('ggthemes')
library(ggthemes)
pl + theme_excel()
pl + theme_economist()
pl + theme_economist_white()
#done
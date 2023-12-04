################################  Create an Annotation layer. ################################

# annotate(geom,
# x = , y = , xmin = , xmax = , ymin = , ymax = , xend = , yend = , ..., na.rm = FALSE)
# Positioning Aesthetics -> x = ,y = ,xmin = ,xmax = ,ymin = ,ymax = ,xend = ,yend = ,
# If--> na.rm = FALSE--> missing values are removed with a warning

p <- ggplot(mtcars, aes(x = wt, y = mpg))+ geom_point()
# # Adding annotate() with "+" symbol to p 
p + annotate("text", x = 4, y = 25, label = "1st text on x=4 y=25")
# we can change to x=3 and y=20
p+annotate("text", x=4,y=20,label="changed to x=4 and y=20")

# # Adding multiple labels
# Horizontal multiple labels
p+annotate("text", x=2:5,y=25,label= "Multiple labels")
# Vertical multiple labels
p+annotate("text", x=3,y=20:30,label= "Multiple labels")

# # Adding rectangle
# xmin and xmax for from 4~to 5 same on y axis, 'alpha =" for rectangle color
p+annotate("rect", xmin=4,xmax=5, ymin = 10,ymax = 35, alpha = 0.3)

# # Adding segment or line -> "xend=" means line ends on ".." x-axis
p+annotate("segment", x=3,xend=4,y=12,yend = 20, color="blue")
p+annotate("segment", x=2,xend=5,y=10,yend = 25, color="red")

# # Adding pointrange(vertical)
p+annotate("pointrange", x=3.5,y=20,ymin = 12.5,ymax = 27.5, color="blue",size = 1, linewidth=1.5)
# ("size"-->size of circle) and ("linewidth"--> thickness of vertical line)

# # Adding multiple and different labels on the chart
p+annotate("text",x=2:3, y=20:21, label=c("first label", "second label"))
# Changing type of text --> label="italic+( ..... )"
p+annotate("text",x=3, y=21, label="italic(firstlabel)", parse=TRUE)

p + annotate("text", x = 4, y = 25, label = "italic(R) ^ 2 == 0.75",parse = TRUE)
p + annotate("text", x = 4, y = 25, label = "paste(italic(R) ^ 2, \" = .75\")", parse = TRUE)



################################### How to annotate a plot in ggplot2 #############################

# Adding text with "geom_text() or geom_label"

# basic graph
library(ggplot2)
p_2 <- ggplot(mtcars, aes(x=wt, y=mpg))+geom_point()

# a data frame with all the annotation info
annotation <- data.frame(
  x = c(2,4.5),
  y=c(20,25),
  label = c("label 1", "label 2")
)

# Add text
p_2+geom_text(data = annotation, aes(x=x,y=y, label=label), color = "orange", size = 7, angle = 45, fontface="bold")

# Note: possible to SHORTEN with annotate:
# p +
#  annotate("text", x = c(2,4.5), y = c(20,25), 
#           label = c("label 1", "label 2") , color="orange", 
#           size=7 , angle=45, fontface="bold")

# RIGHT CHART: USING LABELS
p_2+geom_label(data = annotation, aes(x=x,y=y, label=label,
                                      color="orange",
                                      size=6, 
                                      angle=45,
                                      fontface="bold"))

#         ADD SHAPES with annotate()

# add RECTANGLES
p_2+annotate("rect", xmin = c(2,4),xmax = c(3,5),
             ymin = c(20,10), ymax = c(30,20), 
             alpha = 0.3, color= "black",
             fill= "blue")
 
# add SEGMENTS
p_2+annotate("segment", x=1,xend=3,y=25,
             yend=15,color="purple",
             size=3,alpha=0.6)
# add ARROW
p_2+annotate("segment", x=2,xend=4,
             y=15,yend=25,
             color = "pink", size=3,alpha=0.6,
             arrow=arrow())


#         ADD ABLINES with --> geom_hline() and geom_vline() <--
p_2+
  # horizontal line
  geom_hline(yintercept = 25, color="orange", size = 1)+
  # vertical line
  geom_vline(xintercept = 3, color = "orange", size = 1)


#         ADD a POINT and a RANGE with.. pointrange()

# ADD point and range
p_pointrange <- p_2+ annotate("pointrange", x = 3.5, y = 20, ymin = 12, ymax = 28,
              
              color = "orange", size = 1.5, alpha = 0.4)
p_pointrange+  annotate("segment", x = 2, xend = 5, y = 20, yend = 
                        color = "orange", size = 1.5, alpha = 0.4)





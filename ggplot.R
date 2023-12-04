install.packages("ggplot2")
install.packages("palmerpenguins")
library(ggplot2)
library(palmerpenguins)
data("penguins")

# plot-relationship (body mass and flipper length in the 3 penguins)
ggplot(data = penguins)+geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))


# Enhancing visualization in R
# we add color to species
penguins_color <- ggplot(data = penguins)+geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g, color = species))
# we change color to shape to species
penguins_color_1 <- ggplot(data = penguins)+geom_point(mapping = aes(x = bill_depth_mm, y = body_mass_g, shape = species))
# we move to alpha from shape to species
penguins_color_2 <- ggplot(data = penguins)+geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g, shape = species, alpha = species))

# # Aesthetic attributes
penguins_attr_1 <- ggplot(data = penguins)+geom_jitter(mapping = aes(x = bill_length_mm, y = body_mass_g, ))
penguins_attr_1


# # Doing More with GGPLOT

penguins_double <- ggplot(data = penguins)+geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g))+geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g))
penguins_double

# BAR chart 

diamonds_barchart <- ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut))
diamonds_barchart
# let's add some COLOR to our bar chart
diamonds_barchart_color <- ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut, fill = cut)) # fill automatically adds color to chart
diamonds_barchart_color
# STACKED barchart

diamonds_barchart_color_stacked <- ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut, fill = clarity))
diamonds_barchart_color_stacked
# you can see both variables at the same time in the one barchart

# # FACET and AESTHETICS
# facet_wrap
library(ggplot2)
library(palmerpenguins)
penguins_facet <- ggplot(data = penguins, aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(color = species))+facet_wrap(~species)
penguins_facet
# now we try facet on diamonds dateset
diamonds_facet <- ggplot(data = diamonds)+geom_bar(mapping = aes(x = color, fill = cut))+facet_wrap(~cut)
diamonds_facet

# facet_grid function
# there are 9 separate plots, each based on a combination of 3 species of penguins
diamonds_facet_1 <- ggplot(data = penguins)+geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+facet_grid(sex~species)
diamonds_facet_1

# # # # # # # # # # # # # More resources: # # # # # # # # # # # # # 
#  -  https://www.coursera.org/learn/data-analysis-r/supplement/M8obB/filtering-and-plots
# Data Transformation - https://r4ds.had.co.nz/transform.html
# Visualizing data with ggplot2 - https://datacarpentry.org/dc_zurich/R-ecology/05-visualisation-ggplot2.html
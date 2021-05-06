# DataStudio
DataStudio is an interactive graphical environment for software and data manipulation. Expressive and interactive visualizations are built without any programming knowledge. Domain elements are imported and visualized. The visualization is crafted by mapping metrics and properties to visual dimensions (width, height, color).

DataStudio is built on top of [Roassal](https://AgileVisualization.com/), an expressive library written in the [Pharo programming language](http://pharo.org).

![Data Studio Example](https://raw.githubusercontent.com/ObjectProfile/DataStudio/master/figures/pict1.png)

## Installation
You can load Data studio by executing the following incantation in a playground:

```Smalltalk
Metacello new
    baseline: 'DataStudio';
    repository: 'github://ObjectProfile/DataStudio';
    load.
```

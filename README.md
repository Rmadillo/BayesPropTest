BayesPropTest
=============

simple Bayesian version of R's prop.test

## Bayesian Test of the Difference Between Proportions  

### usage  
<code>bayes.prop.test(n1, d1, n2, d2, a=1, b=1, rep=10000)</code>


### arguments
<code>n1</code>   The numerator of the first group. Required.  

<code>d1</code>   The denominator of the first group. Required. The
proportion *n1/d1* should be greater than or equal to *n2/d2*.  

<code>d2</code>   The denominator of the second group. Required. The
proportion *n2/d2* should be less than or equal to *n1/d1*.  

<code>a</code>   Alpha prior parameter. Defaults to 1.  

<code>b</code>   Beta prior parameter. Defaults to 1.  

<code>rep</code>   Number of replications for the <code>rbeta</code> function. Defaults to 10,000.   


### description

Provides a simple way to perform a Bayesian version of <code>prop.test</code> using the beta distribution.

The default prior distributional parameters are *a* = 1 and *b* = 1.
The prior can be adjusted if you have reasonable information to work with.
If you set *a* < *b*, the density will be weighted toward the lower
half of the distribution, and setting *a* > *b* would weight it
toward the upper half. If *a* = 0.5, much more weight is given to values
near 0, while if *b* = 0.5, weight is stacked up near 1. Examples of
different shapes of the beta distribution based on different parameter values
can be seen at <a href="http://bit.ly/1hOWChG" target = "_blank">Rocscience</a>.  

### examples  
`bayes.prop.test(n1=50, d1=100, n2=20, d2=50)`

<table style="font-size=8px">
<tr><td># difference</td><td>p-hat</td><td>2.5%</td><td>97.5%</td><td>prob.diff>0</td></tr>
<tr><td># 0.10000000</td><td>0.09695006</td><td>-0.07072376 </td><td>0.25873452 </td><td>0.87380000</td><tr>
</table>


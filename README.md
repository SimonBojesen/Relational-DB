# Relational-DB

see assignment description [here](01-relational-db.pdf)

## ER-Diagram

![image](Diagram/ER.png)

# Inheretance strategies pros and cons

## Joint-table strategy
Pros: No redundancy. Good support for polymorphic relationsships

Con: Many JOIN operations when queryring, poor performance, more complicated SQL statements.

## Table-per-class strategy
Pros: Easier overview.

Cons: Redundancy, provides poor support for polymorphic relationsships

## Single-table strategy
Pros: Often very fast, which in some cases where performance outweighs overview is why you choose Single-table.

Cons: Many null cells. Less overview. Not normalized.

## Our strategy

We started by excluding Single-table as in our case it seemed like the cons outweighed the pros. We want that overview. You could also argue that there's not much of a point to choosing a relative database if you are gonna use Single-table Strategy. 

Then we had to choose between the remaining two stategies: Joint-table vs Table-per-class.
We discussed the pros and the cons of both strategies and ended choosing the one with no redundency: Joint-table strategy.
## Implementation


## Install

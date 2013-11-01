Neo4j Workshop
===================

The current project contains the data and queries for an internal presentation at
Kaleidos.

The data is based on the popular book series "A Song of Ice And Fire" by George R.R. Martin.

### Neo4j Instalation

Download Neo4J version 2.0 from this URL: http://www.neo4j.org/download

### Neo4j configuration

Edit the default configuration to enable auto-indexes by the attribute "name". Your configuration
file "neo4j.properties" should look similar to:

```
# Autoindexing
# Enable auto-indexing for nodes, default is false
node_auto_indexing=true

# The node property keys to be auto-indexed, if enabled
node_keys_indexable=name

# Enable auto-indexing for relationships, default is false
relationship_auto_indexing=true

```

### Loading test data

```bash
$NEO4J_HOME/bin/neo4j start
```
To load the test data you only have to execute the following command.

```bash
cat got-example/create_schema | $NEO4J_HOME/bin/neo4j-shell
```
**Warning Backup your data because the first statement deletes all the nodes stored into the graph.**

### Example queries

#### Retrieve the whole graph(s)
```cypher
START n=node(*)
RETURN n;
```

#### Return the children of Tywin Lannister
```cypher
START tywin=node:node_auto_index(name="Tywin Lannister")
MATCH tywin<-[:FATHER]-child
RETURN child;
```
We see that the nodes are not connected. To connect them we need to return the relationship between
the nodes.


```cypher
START tywin=node:node_auto_index(name="Tywin Lannister")
MATCH tywin<-[r:FATHER]-child
RETURN child, r;
```

Or we can just display the result as a list:

```cypher
START tywin=node:node_auto_index(name="Tywin Lannister")
MATCH tywin<-[r:FATHER]-child
RETURN child.name;
```

#### Get the brothers of "Robb Stark"
Display only their names

```cypher
START robb=node:node_auto_index(name="Robb Stark")
MATCH robb-[:FATHER]->()<-[:FATHER]-brother
RETURN brother.name;
```

```cypher
START robb=node:node_auto_index(name="Robb Stark")
MATCH robb-[:FATHER]->father<-[:FATHER]-brother,
    brother-[m:MOTHER]->mother
RETURN robb, father, brother, m, mother
```

#### Get all the members of house Targaryen
```cypher
START house=node:node_auto_index(name="House Targaryen")
MATCH member -[:FATHER]->()-[:HOUSE]-> house
RETURN member.name;
```
Display the nodes and its relationships

```cypher
START house=node:node_auto_index(name="House Targaryen")
MATCH member -[father:FATHER*]->()-[h:HOUSE]-> house
RETURN member, father, house;
```

#### Count all the members of the houses
```cypher
MATCH member -[:FATHER*]->()-[:HOUSE]-> house
RETURN house.name AS House, count(member) AS Members
ORDER By Members ASC;
```

#### Look for bastards
We start by looking for the children that are legitimated, all whose parents are married

```cypher
START child=node(*)
MATCH child-[:FATHER]->father-[:MARRIED]->mother
RETURN child.name, father.name, mother.name;
```
Now we look for the bastards

```cypher
MATCH child-[:FATHER]->father
WHERE NOT(child-[:MOTHER]->()-[:MARRIED]->father)
RETURN child.name, father.name;
```
#### Only "Stark" Bastards
```cypher
START house=node:node_auto_index(name="House Stark")
MATCH member -[:FATHER*]->()-[:HOUSE]-> house
WITH member
MATCH member-[:FATHER]->father
WHERE NOT(member-[:MOTHER]->()-[:MARRIED]->father)
RETURN member.name, father.name;
```

#### Show the relation between Rhaegar Targaryen and Edric Storm
```cypher
START EdricStorm=node:node_auto_index(name="Edric Storm"),
    RhaegarTargaryen=node:node_auto_index(name="Rhaegar Targaryen")
MATCH p=shortestPath(EdricStorm--RhaegarTargaryen)
RETURN p;
```

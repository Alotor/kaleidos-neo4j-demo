// Retrieve the whole graph(s)
START n=node(*)
RETURN N;

// Return the children of Tywin Lannister
START tywin=node:node_auto_index(name="Tywin Lannister")
MATCH tywin<-[:FATHER]-child
RETURN child;

START tywin=node:node_auto_index(name="Tywin Lannister")
MATCH tywin<-[r:FATHER]-child
RETURN child, r;

START tywin=node:node_auto_index(name="Tywin Lannister")
MATCH tywin<-[r:FATHER]-child
RETURN child.name;

// Get the brothers of "Robb Stark"
START robb=node:node_auto_index(name="Robb Stark")
MATCH robb-[:FATHER]->()<-[:FATHER]-brother
RETURN brother.name;

START robb=node:node_auto_index(name="Robb Stark")
MATCH robb-[:FATHER]->father<-[:FATHER]-brother,
    brother-[m:MOTHER]->mother
RETURN robb, father, brother, m, mother

// Get all the members of house Targaryen
START house=node:node_auto_index(name="House Targaryen")
MATCH member -[:FATHER]->()-[:HOUSE]-> house
RETURN member.name;

START house=node:node_auto_index(name="House Targaryen")
MATCH member -[father:FATHER*]->()-[h:HOUSE]-> house
RETURN member, father, house;

// Count all the members of the houses
MATCH member -[:FATHER*]->()-[:HOUSE]-> house
RETURN house.name AS House, count(member) Members
ORDER By Members ASC;

// Look for bastards
START child=node(*)
MATCH child-[:FATHER]->father-[:MARRIED]->mother
RETURN child.name, father.name, mother.name;

MATCH child-[:FATHER]->father
WHERE NOT(child-[:MOTHER]->()-[:MARRIED]->father)
RETURN child.name, father.name;

// Only "Stark" Bastards
START house=node:node_auto_index(name="House Stark")
MATCH member -[:FATHER*]->()-[:HOUSE]-> house
WITH member
MATCH member-[:FATHER]->father
WHERE NOT(member-[:MOTHER]->()-[:MARRIED]->father)
RETURN member.name, father.name;

// Show the relation between Rhaegar Targaryen and Edric Storm
START EdricStorm=node:node_auto_index(name="Edric Storm"),
    RhaegarTargaryen=node:node_auto_index(name="Rhaegar Targaryen")
MATCH p=shortestPath(EdricStorm--RhaegarTargaryen)
RETURN p;


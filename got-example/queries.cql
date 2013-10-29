// Brothers of Robb Stark
START robb=node:node_auto_index(name="Robb Stark")
MATCH robb-[:FATHER]->()<-[:FATHER]-brother
RETURN brother.name;

// Bedlock childs
START child=node(*) 
MATCH child-[:FATHER]->father-[:MARRIED]->mother
RETURN child.name, father.name, mother.name;

// Looking for bastards
START child=node(*) 
MATCH child-[:FATHER]->father
WHERE NOT(child-[:MOTHER]->()-[:MARRIED]->father)
RETURN child.name, father.name;

// Return all members of house stark
START house=node:node_auto_index(name="House Stark")
MATCH stark -[:FATHER]->()-[:HOUSE]-> house
RETURN stark.name;

// Search for the relation between Edric Storm and Rhaegar Targaryen
START EdricStorm=node:node_auto_index(name="Edric Storm"), 
    RhaegarTargaryen=node:node_auto_index(name="Rhaegar Targaryen")
MATCH p=shortestPath(EdricStorm--RhaegarTargaryen)
RETURN p;

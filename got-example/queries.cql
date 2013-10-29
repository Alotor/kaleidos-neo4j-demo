// Brothers of Robb Stark
START robb=node:node_auto_index(name="Robb Stark")
MATCH robb-[:FATHER]->()<-[:FATHER]-brother
RETURN brother.name;

// Looking for bastards
START 
    child=node(*) 
MATCH 
    child<-[:FATHER]-parent
WHERE 
    NOT(child<-[:MOTHER]-())
RETURN 
    child.name, parent.name;

// Return all members of house stark
START 
    house=node:node_auto_index(name="House Stark")
MATCH
    stark -[:FATHER]->()-[:HOUSE]-> house
RETURN stark.name;

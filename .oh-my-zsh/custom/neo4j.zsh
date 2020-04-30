neo4j-connect () {
  cypher-shell -a bolt://localhost:${NEO4J_PORT-7687} -u ${NEO4J_USER-neo4j} -p ${NEO4J_PASSWORD-neo4j}
}

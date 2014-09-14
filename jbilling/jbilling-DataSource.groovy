import org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsAnnotationConfiguration

dataSource {
    /*
      Database dialect:*/
	  
        org.hibernate.dialect.HSQLDialect
        org.hibernate.dialect.MySQLDialect
        org.hibernate.dialect.Oracle9Dialect
    
    /* dialect = "org.hibernate.dialect.HSQLDialect"
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
    url = "jdbc:hsqldb:file:hsql/localDB"

    pooled = true
    configClass = GrailsAnnotationConfiguration.class
    dbCreate = "none"
	*/
	dialect = "org.hibernate.dialect.PostgreSQLDialect"
    driverClassName = "org.postgresql.Driver"
    username = "jbilling"
    password = "jbilling"
    url = "jdbc:postgresql://localhost:5432/jbilling_test"
	pooled = true
    configClass = GrailsAnnotationConfiguration.class
    dbCreate = "none"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'

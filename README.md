# Elastic Provisioner

Import & export Elasticsearch data, e.g. Kibana dashboards & configuration.

## Provision (Import)

Upload documents from `import` to Elasticsearch (`ES_BASE_URI`)

```bash
docker run --rm -v /var/import:/app/import awesomeinc/elastic_provisioner
```

## Export

Export documents of an Elasticsearch index

```bash
docker run --rm -v /var/export:/app/export awesomeinc/elastic_provisioner ruby export.rb [index=.kibana] [output=export]
```

This fetches the `.kibana` index and downloads documents into `/var/export`.

Elasticsearch Query and ActiveRecord for Yii 2
==============================================

This extension provides the [elasticsearch](https://www.elastic.co/products/elasticsearch) integration for the [Yii framework 2.0](http://www.yiiframework.com).
It includes basic querying/search support and also implements the `ActiveRecord` pattern that allows you to store active
records in elasticsearch.

For license information check the [LICENSE](LICENSE.md)-file.

Documentation is at [docs/guide/README.md](docs/guide/README.md).

[![Latest Stable Version](https://poser.pugx.org/yiisoft/yii2-elasticsearch/v/stable.png)](https://packagist.org/packages/yiisoft/yii2-elasticsearch)
[![Total Downloads](https://poser.pugx.org/yiisoft/yii2-elasticsearch/downloads.png)](https://packagist.org/packages/yiisoft/yii2-elasticsearch)
[![Build Status](https://travis-ci.org/yiisoft/yii2-elasticsearch.svg?branch=master)](https://travis-ci.org/yiisoft/yii2-elasticsearch)

Requirements
------------

Dependent on the version of elasticsearch you are using you need a different version of this extension.

- Extension version 2.0.x works with elasticsearch version 1.0 to 4.x.
- Extension version 2.1.x requires at least elasticsearch version 5.0.

Installation
------------

The preferred way to install this extension is through [composer](http://getcomposer.org/download/).

Either run

```
php composer.phar require --prefer-dist yiisoft/yii2-elasticsearch
```

or add

```json
"yiisoft/yii2-elasticsearch": "~2.1.0"
```

to the require section of your composer.json.

Configuration
-------------

To use this extension, you have to configure the Connection class in your application configuration:

```php
return [
    //....
    'components' => [
        'elasticsearch' => [
            'class' => 'yii\elasticsearch\Connection',
            'nodes' => [
                ['http_address' => '127.0.0.1:9200'],
                // configure more hosts if you have a cluster
            ],
        ],
    ]
];
```

Tests
-----

### Running test in Docker
Start ES container
```
 docker run -d --name elastic elasticsearch:alpine
```
Put local config in `tests/data/config.local.php`:
```
<?php
$config['elasticsearch']['nodes'] = [['http_address' => 'es:9200']];
```

Run tests

```
docker run --rm --link elastic:es -v $PWD:/code yii2-es-app:latest
```
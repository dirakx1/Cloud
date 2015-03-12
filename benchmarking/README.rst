Benchmarking
------------

You can do stress tests with different tools here are some examples:

SIEGE
-----

* yum install siege
* apt-get install siege

.. code::
    sudo siege --concurrent=50 --reps=100 http://example.com
    sudo siege --concurrent=100 --reps=100 http://example.com

You can set different urls in an url.txt file and repeat the process

.. code::
    sudo siege --concurrent=50 --reps=100 -f urls.txt


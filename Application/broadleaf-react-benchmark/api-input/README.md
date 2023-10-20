## Description of data files

TODO add data description here if needed.

```
├── api-input
     ├── add-item-POST-request-9-1.data      # an anonymous users adds a item to an empty cart (the cart already exists).
     ├── add-item-POST-response-9-1.data      
     ├── cart-GET-request-9-1.data   # a user (wyy@gmail.com) views his cart
     ├── cart-GET-response-9-1.data   
     ├── remove-item-DELETE-request-9-1.data   # 
     ├── remove-item-DELETE-response-9-1.data   
     ├── customer-payment-POST-request-9-1.data   #
     ├── customer-payment-POST-response-9-1.data   
     ├── shipping-PATCH-request-9-1.data   #
     ├── shipping-PATCH-response-9-1.data   
     ├── updateq-up-PUT-request-9-1.data      # a user (wyy@gmail.com) increase the quantity of an exsit item 
     ├── updateq-up-PUT-response-9-1.data
     ├── updateq-down-PUT-request-9-1.data      # a user (wyy@gmail.com) decrease the quantity of an exsit item 
     ├── updateq-down-PUT-response-9-1.data
     ├── seo-GET-category-request-9-1.data
     ├── seo-GET-category-response-9-1.data
     ├── seo-GET-category-9-1.data
     ├── breadcrumbs-GET-request-9-1.data
     ├── breadcrumbs-GET-response-9-1.data
     ├── breadcrumbs-GET-9-1.data
     ├── related-products-GET-request-9-1.data
     ├── related-products-GET-response-9-1.data
     ├── related-products-GET-9-1.data
     ├── catalog-product-hot-sauces-day_of_the_dead_chipotle_hot_sauce-GET-request-9-1.data
     ├── catalog-product-hot-sauces-day_of_the_dead_chipotle_hot_sauce-GET-response-9-1.data
     ├── catalog-product-hot-sauces-day_of_the_dead_chipotle_hot_sauce-GET-9-1.data
     ├── ratings-4-GET-request-9-1.data
     ├── ratings-4-GET-response-9-1.data
     ├── ratings-4-GET-9-1.data
     ├── blf_with_user.sql       # database data with the created user (wyy@gmail.com) and the created cart
     ├── blf_rect_updateq_initial.sql       # database data with the created user (wyy@gmail.com) and the cart with one item (the item added by api/v1/cart/51/item-POST-request-7-1.data)
     ├── blf_react_add_initial.sql    # it is also the initial environment for seo, breadcrumbs, related-products, itemDetails and rating api
     ├── blf_react_payment_initial.sql 
     ├── blf_react_read_cart_first_time.sql # database data before a user retrieves it's cart at the first time
     ├── blf_react_remove_initial.sql 
     ├── blf_react_updateq_up_initial.sql    
     ├── blf_react_with_user.sql  # database with the created user (wyy@gmail.com)
     ├── hib-data               # expanded metadata information
     ├── hib-enhanced-class     # recorded enhanced bytecode files
     └── README.md
```

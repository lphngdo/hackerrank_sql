SELECT product.sku,
       product.product_name
  FROM PRODUCT AS product
 WHERE product.id NOT IN (
       SELECT product_id
         FROM INVOICE_ITEM
 );

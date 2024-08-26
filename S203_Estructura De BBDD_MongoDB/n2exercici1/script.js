db.createCollection('order', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'order',
      required: ['client', 'date_creation', 'type', 'note', 'total_price', 'products', 'paid', 'restaurant'],
      properties: {
        client: {
          bsonType: 'object',
          title: 'object',
          required: ['client_id', 'name', 'surnames', 'address', 'postal_code', 'city', 'province', 'telephone'],
          properties: {
            client_id: {
              bsonType: 'objectId'
            },
            name: {
              bsonType: 'string'
            },
            surnames: {
              bsonType: 'string'
            },
            address: {
              bsonType: 'string'
            },
            postal_code: {
              bsonType: 'string'
            },
            city: {
              bsonType: 'string'
            },
            province: {
              bsonType: 'string'
            },
            telephone: {
              bsonType: 'int'
            }
          }
        },
        date_creation: {
          bsonType: 'date'
        },
        type: {
          enum: "delivery",
          "dine-in"
        },
        note: {
          bsonType: 'string'
        },
        total_price: {
          bsonType: 'decimal'
        },
        products: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['product_id', 'name', 'quantity', 'price'],
            properties: {
              product_id: {
                bsonType: 'objectId'
              },
              name: {
                bsonType: 'string'
              },
              quantity: {
                bsonType: 'int'
              },
              price: {
                bsonType: 'decimal'
              }
            }
          }
        },
        paid: {
          bsonType: 'object',
          title: 'object',
          required: ['status'],
          properties: {
            status: {
              bsonType: 'bool'
            },
            payment_date: {
              bsonType: 'date'
            }
          }
        },
        delivered: {
          bsonType: 'object',
          title: 'object',
          required: ['status'],
          properties: {
            status: {
              bsonType: 'bool'
            },
            delivery_date: {
              bsonType: 'date'
            },
            employee: {
              bsonType: 'objectId'
            }
          }
        },
        restaurant: {
          bsonType: 'objectId'
        }
      }
    }
  }
});
db.createCollection('product', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'product',
      required: ['name', 'description', 'price', 'type'],
      properties: {
        name: {
          bsonType: 'string'
        },
        description: {
          bsonType: 'string'
        },
        image: {
          bsonType: 'string'
        },
        price: {
          bsonType: 'decimal'
        },
        type: {
          enum: "hamburger",
          "pizza",
          "drink"
        },
        tag: {
          bsonType: 'array',
          items: {
            bsonType: 'array'
          }
        }
      }
    }
  }
});
db.createCollection('restaurant', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'restaurant',
      required: ['address', 'postal_code', 'city', 'province', 'employee'],
      properties: {
        address: {
          bsonType: 'string'
        },
        postal_code: {
          bsonType: 'string'
        },
        city: {
          bsonType: 'string'
        },
        province: {
          bsonType: 'string'
        },
        employee: {
          bsonType: 'array',
          items: {
            bsonType: 'objectId'
          }
        }
      }
    }
  }
});
db.createCollection('employee', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'employee',
      required: ['name', 'surnames', 'NIF', 'telephone', 'job'],
      properties: {
        name: {
          bsonType: 'string'
        },
        surnames: {
          bsonType: 'string'
        },
        NIF: {
          bsonType: 'string'
        },
        telephone: {
          bsonType: 'int'
        },
        job: {
          enum: "cook",
          "delivery man"
        }
      }
    }
  }
});
Generated: 26 / 8 / 2024 | 12: 32: 34 by Moon Modeler - www.datensen.com
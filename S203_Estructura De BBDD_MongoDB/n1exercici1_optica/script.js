db.createCollection('supplier', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'supplier',
      required: ['name', 'address', 'telephone', 'NIF'],
      properties: {
        name: {
          bsonType: 'string'
        },
        address: {
          bsonType: 'object',
          title: 'object',
          required: ['street', 'number', 'city', 'postal_code', 'country'],
          properties: {
            street: {
              bsonType: 'string'
            },
            number: {
              bsonType: 'int'
            },
            floor: {
              bsonType: 'string'
            },
            door: {
              bsonType: 'string'
            },
            city: {
              bsonType: 'string'
            },
            postal_code: {
              bsonType: 'string'
            },
            country: {
              bsonType: 'string'
            }
          }
        },
        telephone: {
          bsonType: 'int'
        },
        fax: {
          bsonType: 'int'
        },
        NIF: {
          bsonType: 'string'
        }
      }
    }
  },
  autoIndexId: true
});
db.createCollection('glasses', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'glasses',
      required: ['brand', 'lens_color', 'frame', 'supplier'],
      properties: {
        brand: {
          bsonType: 'string'
        },
        lens_power: {
          bsonType: 'object',
          title: 'object',
          properties: {
            right: {
              bsonType: 'string'
            },
            left: {
              bsonType: 'string'
            }
          }
        },
        lens_color: {
          bsonType: 'object',
          title: 'object',
          properties: {
            right: {
              bsonType: 'string'
            },
            left: {
              bsonType: 'string'
            }
          }
        },
        frame: {
          bsonType: 'object',
          title: 'object',
          properties: {
            type: {
              enum:
            },
            color: {
              bsonType: 'string'
            }
          }
        },
        price: {
          bsonType: 'decimal'
        },
        supplier: {
          bsonType: 'objectId'
        }
      }
    }
  },
  autoIndexId: true
});
db.createCollection('client', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'client',
      required: ['name', 'registration_date'],
      properties: {
        name: {
          bsonType: 'string'
        },
        address: {
          bsonType: 'object',
          title: 'object',
          required: ['street', 'number', 'city', 'postal_code', 'country'],
          properties: {
            street: {
              bsonType: 'string'
            },
            number: {
              bsonType: 'int'
            },
            floor: {
              bsonType: 'string'
            },
            door: {
              bsonType: 'string'
            },
            city: {
              bsonType: 'string'
            },
            postal_code: {
              bsonType: 'string'
            },
            country: {
              bsonType: 'string'
            }
          }
        },
        telephone: {
          bsonType: 'int'
        },
        email: {
          bsonType: 'string'
        },
        registration_date: {
          bsonType: 'date'
        },
        recommended_by: {
          bsonType: 'objectId'
        }
      }
    }
  },
  autoIndexId: true
});
db.createCollection('employee', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'employee',
      required: ['name'],
      properties: {
        name: {
          bsonType: 'string'
        },
        address: {
          bsonType: 'object',
          title: 'object',
          required: ['street', 'number', 'city', 'postal_code', 'country'],
          properties: {
            street: {
              bsonType: 'string'
            },
            number: {
              bsonType: 'int'
            },
            floor: {
              bsonType: 'string'
            },
            door: {
              bsonType: 'string'
            },
            city: {
              bsonType: 'string'
            },
            postal_code: {
              bsonType: 'string'
            },
            country: {
              bsonType: 'string'
            }
          }
        },
        telephone: {
          bsonType: 'int'
        }
      }
    }
  },
  autoIndexId: true
});
db.createCollection('sale', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'sale',
      required: ['sale_date', 'glasses', 'employee', 'client'],
      properties: {
        sale_date: {
          bsonType: 'date'
        },
        glasses: {
          bsonType: 'objectId'
        },
        employee: {
          bsonType: 'objectId'
        },
        client: {
          bsonType: 'objectId'
        }
      }
    }
  }
});
Generated: 22 / 8 / 2024 | 11: 21: 56 by Moon Modeler - www.datensen.com
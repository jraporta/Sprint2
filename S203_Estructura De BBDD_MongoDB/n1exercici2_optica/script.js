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
      required: ['brand', 'frame_type', 'supplier'],
      properties: {
        brand: {
          bsonType: 'string'
        },
        frame_type: {
          enum:
        },
        price: {
          bsonType: 'decimal'
        },
        supplier: {
          bsonType: 'objectId'
        },
        sales: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['client', 'employee', 'details', 'date'],
            properties: {
              client: {
                bsonType: 'objectId'
              },
              employee: {
                bsonType: 'object',
                title: 'object',
                required: ['name'],
                properties: {
                  name: {
                    bsonType: 'string'
                  },
                  telephone: {
                    bsonType: 'string'
                  }
                }
              },
              details: {
                bsonType: 'object',
                title: 'object',
                properties: {
                  lens_graduation: {
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
                  frame_color: {
                    bsonType: 'string'
                  }
                }
              },
              date: {
                bsonType: 'date'
              }
            }
          }
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
      required: ['name', 'sale', 'registration_date', 'recommended_by'],
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
        sale: {
          bsonType: 'array',
          items: {
            bsonType: 'objectId'
          }
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
Generated: 22 / 8 / 2024 | 12: 42: 05 by Moon Modeler - www.datensen.com
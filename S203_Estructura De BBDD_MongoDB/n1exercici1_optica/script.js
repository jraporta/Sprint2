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
      required: ['brand', 'frame_type', 'supplier_id'],
      properties: {
        brand: {
          bsonType: 'string'
        },
        frame_type: {
          enum: "Plastic",
          "Metallic",
          "Frameless"
        },
        price: {
          bsonType: 'decimal'
        },
        supplier_id: {
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
      required: ['name', 'registration_date', 'recommended_by'],
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
        last_ four_sales_overview: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['date', 'glasses', 'price', 'sale_id'],
            properties: {
              date: {
                bsonType: 'date'
              },
              glasses: {
                bsonType: 'object',
                title: 'object',
                required: ['model_id', 'brand', 'frame_type'],
                properties: {
                  model_id: {
                    bsonType: 'objectId'
                  },
                  brand: {
                    bsonType: 'string'
                  },
                  frame_type: {
                    enum: "Plastic",
                    "Metallic",
                    "Frameless"
                  },
                  frame_color: {
                    bsonType: 'string'
                  },
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
                  }
                }
              },
              price: {
                bsonType: 'decimal'
              },
              sale_id: {
                bsonType: 'objectId'
              }
            }
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
db.createCollection('sale', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'sale',
      required: ['employee', 'date', 'glasses1', 'price'],
      properties: {
        employee: {
          bsonType: 'object',
          title: 'object',
          required: ['employee_id', 'name'],
          properties: {
            employee_id: {
              bsonType: 'objectId'
            },
            name: {
              bsonType: 'string'
            },
            telephone: {
              bsonType: 'string'
            }
          }
        },
        date: {
          bsonType: 'date'
        },
        glasses1: {
          bsonType: 'object',
          title: 'object',
          required: ['model_id'],
          properties: {
            model_id: {
              bsonType: 'objectId'
            },
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
        price: {
          bsonType: 'decimal'
        }
      }
    }
  }
});
Generated: 26 / 8 / 2024 | 12: 02: 45 by Moon Modeler - www.datensen.com
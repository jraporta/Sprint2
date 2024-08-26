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
              "Metallic, "
              Frameless "},price:{bsonType: 'decimal'},supplier_id:{bsonType: 'objectId'},recent_sales_overview:{bsonType: 'array',items:{title: 'object',required: ['client_id','client_name','sale_id'],properties:{client_id:{bsonType: 'null'},client_name:{bsonType: 'string'},sale_id:{bsonType: 'null'}}}}}}},autoIndexId: true});
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
                    required: ['client_id', 'glasses_id', 'employee', 'details', 'date', 'price'],
                    properties: {
                      client_id: {
                        bsonType: 'objectId'
                      },
                      glasses_id: {
                        bsonType: 'objectId'
                      },
                      employee: {
                        bsonType: 'object',
                        title: 'object',
                        required: ['name', 'employee_id'],
                        properties: {
                          name: {
                            bsonType: 'string'
                          },
                          telephone: {
                            bsonType: 'string'
                          },
                          employee_id: {
                            bsonType: 'objectId'
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
                      },
                      price: {
                        bsonType: 'decimal'
                      }
                    }
                  }
                }
              });
              Generated: 26 / 8 / 2024 | 12: 20: 32 by Moon Modeler - www.datensen.com
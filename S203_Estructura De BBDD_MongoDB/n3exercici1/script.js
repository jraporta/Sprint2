db.createCollection('video', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'video',
      required: ['title', 'size', 'file_name', 'length', 'play_count', 'like_count', 'dislike_count', 'user', 'status', 'comment'],
      properties: {
        title: {
          bsonType: 'string'
        },
        description: {
          bsonType: 'string'
        },
        size: {
          bsonType: 'int'
        },
        file_name: {
          bsonType: 'string'
        },
        length: {
          bsonType: 'int'
        },
        thumbnail: {
          bsonType: 'string'
        },
        play_count: {
          bsonType: 'int'
        },
        like_count: {
          bsonType: 'int'
        },
        dislike_count: {
          bsonType: 'int'
        },
        user: {
          bsonType: 'objectId'
        },
        publish_date: {
          bsonType: 'date'
        },
        status: {
          enum: "private",
          "public",
          "unlisted"
        },
        tags: {
          bsonType: 'array',
          items: {
            bsonType: 'string'
          }
        },
        likes: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['date', 'user'],
            properties: {
              date: {
                bsonType: 'date'
              },
              user: {
                bsonType: 'objectId'
              }
            }
          }
        },
        dislikes: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['date', 'user'],
            properties: {
              date: {
                bsonType: 'date'
              },
              user: {
                bsonType: 'objectId'
              }
            }
          }
        },
        comment: {
          bsonType: 'array',
          items: {
            bsonType: 'objectId'
          }
        }
      }
    }
  }
});
db.createCollection('user', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'user',
      required: ['email', 'password', 'user_name', 'date_of_birth', 'country', 'postal_code'],
      properties: {
        email: {
          bsonType: 'string'
        },
        password: {
          bsonType: 'string'
        },
        user_name: {
          bsonType: 'string'
        },
        date_of_birth: {
          bsonType: 'date'
        },
        gender: {
          enum: "M",
          "F"
        },
        country: {
          bsonType: 'string'
        },
        postal_code: {
          bsonType: 'string'
        },
        channel: {
          bsonType: 'object',
          title: 'object',
          required: ['name', 'description', 'creation_date'],
          properties: {
            name: {
              bsonType: 'string'
            },
            description: {
              bsonType: 'string'
            },
            creation_date: {
              bsonType: 'date'
            }
          }
        },
        suscriptions: {
          bsonType: 'array',
          items: {
            bsonType: 'objectId'
          }
        },
        playlists: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['name', 'date_of_creation', 'status'],
            properties: {
              name: {
                bsonType: 'string'
              },
              date_of_creation: {
                bsonType: 'date'
              },
              status: {
                enum: "public",
                "private"
              }
            }
          }
        }
      }
    }
  }
});
db.createCollection('comment', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'comment',
      required: ['message', 'date', 'user'],
      properties: {
        message: {
          bsonType: 'string'
        },
        date: {
          bsonType: 'date'
        },
        responses: {
          bsonType: 'array',
          items: {
            bsonType: 'objectId'
          }
        },
        user: {
          bsonType: 'objectId'
        },
        likes: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['date', 'user'],
            properties: {
              date: {
                bsonType: 'date'
              },
              user: {
                bsonType: 'objectId'
              }
            }
          }
        },
        dislikes: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['date', 'user'],
            properties: {
              date: {
                bsonType: 'date'
              },
              user: {
                bsonType: 'objectId'
              }
            }
          }
        }
      }
    }
  }
});
Generated: 22 / 8 / 2024 | 14: 34: 59 by Moon Modeler - www.datensen.com
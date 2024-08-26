db.createCollection('video', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'video',
      required: ['title', 'size', 'file_name', 'length', 'play_count', 'like_count', 'dislike_count', 'owner', 'status'],
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
        owner: {
          bsonType: 'object',
          title: 'object',
          required: ['name', 'user_id'],
          properties: {
            name: {
              bsonType: 'string'
            },
            user_id: {
              bsonType: 'objectId'
            }
          }
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
        last_comments_overview: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['message', 'reply_count', 'like_count', 'dislike_count', 'author', 'date'],
            properties: {
              comment_id: {
                bsonType: 'objectId'
              },
              message: {
                bsonType: 'string'
              },
              reply_count: {
                bsonType: 'int'
              },
              like_count: {
                bsonType: 'int'
              },
              dislike_count: {
                bsonType: 'int'
              },
              author: {
                bsonType: 'object',
                title: 'object',
                required: ['user_id', 'name'],
                properties: {
                  user_id: {
                    bsonType: 'objectId'
                  },
                  name: {
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
            title: 'object',
            required: ['name', 'channel_id'],
            properties: {
              name: {
                bsonType: 'string'
              },
              channel_id: {
                bsonType: 'objectId'
              }
            }
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
              },
              videos: {
                bsonType: 'array',
                items: {
                  title: 'object',
                  required: ['video_id', 'name'],
                  properties: {
                    video_id: {
                      bsonType: 'objectId'
                    },
                    name: {
                      bsonType: 'string'
                    },
                    thumbnail: {
                      bsonType: 'string'
                    }
                  }
                }
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
      required: ['author', 'message', 'date', 'like_count', 'dislike_count', 'video_id', 'reply_count'],
      properties: {
        author: {
          bsonType: 'object',
          title: 'object',
          required: ['user_id', 'name'],
          properties: {
            user_id: {
              bsonType: 'objectId'
            },
            name: {
              bsonType: 'string'
            }
          }
        },
        message: {
          bsonType: 'string'
        },
        date: {
          bsonType: 'date'
        },
        like_count: {
          bsonType: 'int'
        },
        dislike_count: {
          bsonType: 'int'
        },
        video_id: {
          bsonType: 'objectId'
        },
        reply_to: {
          bsonType: 'objectId'
        },
        reply_count: {
          bsonType: 'int'
        }
      }
    }
  }
});
db.createCollection('video_has_likes_and_dislikes', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'video_has_likes_and_dislikes',
      required: ['video_id', 'user_id', 'type'],
      properties: {
        video_id: {
          bsonType: 'objectId'
        },
        user_id: {
          bsonType: 'objectId'
        },
        type: {
          enum: "like",
          "dislike"
        }
      }
    }
  }
});
db.createCollection('comment_has_likes_and_dislikes', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'comment_has_likes_and_dislikes',
      required: ['comment_id', 'user_id', 'type'],
      properties: {
        comment_id: {
          bsonType: 'objectId'
        },
        user_id: {
          bsonType: 'objectId'
        },
        type: {
          enum: "like",
          "dislike"
        }
      }
    }
  }
});
Generated: 26 / 8 / 2024 | 13: 06: 20 by Moon Modeler - www.datensen.com
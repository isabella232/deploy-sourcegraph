{ apiVersion = "v1"
, kind = "Service"
, metadata =
  { annotations = Some
      ( toMap
          { `sourcegraph.prometheus/scrape` = "true"
          , `prometheus.io/port` = "9121"
          }
      )
  , clusterName = None Text
  , creationTimestamp = None Text
  , deletionGracePeriodSeconds = None Natural
  , deletionTimestamp = None Text
  , finalizers = None (List Text)
  , generateName = None Text
  , generation = None Natural
  , labels = Some
      ( toMap
          { sourcegraph-resource-requires = "no-cluster-admin"
          , app = "redis-cache"
          , deploy = "sourcegraph"
          }
      )
  , managedFields =
      None
        ( List
            { apiVersion : Text
            , fieldsType : Optional Text
            , fieldsV1 : Optional (List { mapKey : Text, mapValue : Text })
            , manager : Optional Text
            , operation : Optional Text
            , time : Optional Text
            }
        )
  , name = Some "redis-cache"
  , namespace = None Text
  , ownerReferences =
      None
        ( List
            { apiVersion : Text
            , blockOwnerDeletion : Optional Bool
            , controller : Optional Bool
            , kind : Text
            , name : Text
            , uid : Text
            }
        )
  , resourceVersion = None Text
  , selfLink = None Text
  , uid = None Text
  }
, spec = Some
  { clusterIP = None Text
  , externalIPs = None (List Text)
  , externalName = None Text
  , externalTrafficPolicy = None Text
  , healthCheckNodePort = None Natural
  , ipFamily = None Text
  , loadBalancerIP = None Text
  , loadBalancerSourceRanges = None (List Text)
  , ports = Some
    [ { name = Some "redis"
      , nodePort = None Natural
      , port = 6379
      , protocol = None Text
      , targetPort = Some (< Int : Natural | String : Text >.String "redis")
      }
    ]
  , publishNotReadyAddresses = None Bool
  , selector = Some (toMap { app = "redis-cache" })
  , sessionAffinity = None Text
  , sessionAffinityConfig =
      None { clientIP : Optional { timeoutSeconds : Optional Natural } }
  , topologyKeys = None (List Text)
  , type = Some "ClusterIP"
  }
, status =
    None
      { loadBalancer :
          Optional
            { ingress :
                Optional (List { hostname : Optional Text, ip : Optional Text })
            }
      }
}

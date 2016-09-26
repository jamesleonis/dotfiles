(set-env!
 :dependencies '[[org.clojure/clojure "1.8.0" :scope "provided"]
                 [org.clojure/tools.namespace "0.3.0-alpha3"]
                 [cljfmt "0.5.2"]])

(require '[clojure.tools.namespace.repl :refer [refresh refresh-all] :as repl])
(require '[cljfmt.core :refer :all])

(apply repl/set-refresh-dirs (get-env :source-paths))

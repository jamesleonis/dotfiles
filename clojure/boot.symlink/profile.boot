(set-env!
 :dependencies '[[org.clojure/clojure "1.8.0" :scope "provided"]
                 [org.clojure/tools.namespace "0.3.0-alpha3"]
                 [cider/cider-nrepl "0.13.0"]
                 [cljfmt "0.5.2"]])

(require '[clojure.tools.namespace.repl :refer [refresh refresh-all] :as repl])
(require '[cljfmt.core :refer :all])

(apply repl/set-refresh-dirs (get-env :source-paths))

(require 'boot.repl)

(swap! boot.repl/*default-middleware*
       conj 'cider.nrepl/cider-middleware)

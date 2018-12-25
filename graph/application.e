note
	description: "graph application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32
	--CONSOLE

create
	make

feature {NONE} -- Initialization

	make
		local
			graph : DIGRAPH[INTEGER]
			graph2 : GRAPH[INTEGER]
			dfs : DFSAGENT[INTEGER]
			-- Run application.
		do
			--| Add your code here
			print("Gráf inicializálása%N")
			create graph.init(10)
			print("Csomópontok hozzáadása%N")
			graph.addnode (0)
			graph.addnode (1)
			graph.addnode (2)
			graph.addnode (3)
			graph.addnode (4)
			graph.addnode (5)
			print("Élek hozzáadása%N")
			graph.addedge (0,1)
			graph.addedge (0,2)
			graph.addedge (1,3)
			graph.addedge (2,4)
			graph.addedge (2,5)
			print("Van-e él a 0 és az 1 csúcsok között?%N")
			print( graph.isthereedge (0,1))
			print("Van-e él a 1 és az 0 csúcsok között?%N")
			print( graph.isthereedge (1,0))

			print("Van-e él a 0 és az 2 csúcsok között?%N")
			print(graph.isthereedge (0,2))
			create dfs.init (graph.count)
			graph.bejaras (dfs)

			--print("olyan él létrehozása, amelynek a csúcsai nincsenek ebben a gráfban")
			--graph.addedge (0,44)

	--		create graph2.init (10)
	--		graph2.addnode (0)
	--		graph2.addnode (1)
	--		graph2.addnode (2)
	--		graph2.addedge (0,1)
	--		print(graph2.isthereedge (1,0))

		end

end

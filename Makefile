uml: calendar_server_sequence.puml calendar_server_sequence_others.puml calendar_server_use_case.puml calendar_server_parallel_case.puml
	plantuml -tpng calendar_server_sequence.puml -o "../pngs"
	plantuml -tpng calendar_server_sequence_others.puml -o "../pngs"
	plantuml -tpng calendar_server_use_case.puml -o "../pngs"
	plantuml -tpng calendar_server_parallel_case.puml -o "../pngs"

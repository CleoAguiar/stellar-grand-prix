# Script: CapturadorMapa.gd
extends Node

# CONFIGURAÇÕES (Baseadas nas suas coordenadas)
var world_min: Vector2 = Vector2(-7400, -6200)
var world_size: Vector2 = Vector2(12672, 7128)
var nome_do_arquivo: String = "res://assets/maps/minimapa_gerado.png"


func _ready() -> void:
	# Aguarda o jogo carregar completamente
	await get_tree().process_frame
	capturar_pista_completa.call_deferred()

func capturar_pista_completa() -> void:
	print("Iniciando captura do mapa...")
	
	# 1. Cria o Viewport virtual no tamanho exato da pista real
	var vp = SubViewport.new()
	vp.size = world_size
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	
	# Linka o mundo 2D atual para ele renderizar seu labirinto
	vp.world_2d = get_tree().current_scene.get_world_2d()
	add_child(vp)
	
	# 2. Cria uma câmera dentro desse viewport virtual
	var cam = Camera2D.new()
	# Centraliza a câmera exatamente no meio do labirinto
	cam.global_position = world_min + (world_size / 2)
	# Sem zoom (1.0), para pegar cada pixel na qualidade nativa
	cam.zoom = Vector2.ONE 
	vp.add_child(cam)
	
	# 3. Aguarda o motor do Godot terminar de renderizar o frame interno
	await RenderingServer.frame_post_draw
	
	# 4. Captura a textura gerada e converte em imagem
	var img: Image = vp.get_texture().get_image()
	
	# 5. Salva em PNG na pasta do seu projeto
	var erro = img.save_png(nome_do_arquivo)
	
	if erro == OK:
		print("SUCESSO! Mapa salvo em: ", nome_do_arquivo)
	else:
		print("Erro ao salvar imagem. Código do erro: ", erro)
		
	# Fecha o jogo automaticamente após salvar
	get_tree().quit()

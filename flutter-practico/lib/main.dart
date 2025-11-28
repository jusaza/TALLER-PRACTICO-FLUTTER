import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Estudiante',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StudentProfile(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  // Lista de habilidades
  final List<String> skills = [
    'Flutter',
    'Dart',
    'UI/UX Design',
    'Firebase',
    'API Integration',
    'Git',
    'Responsive Design'
  ];

  final List<String> projects = [
    'assets/project1.jpg',
    'assets/project2.jpg',
    'assets/project3.jpg',
    'assets/project4.jpg',
    'assets/project5.jpg',
    'assets/project6.jpg',
  ];

  void _onSkillPressed(String skill) {
    print('✅ Habilidad seleccionada: $skill');
    print('🎯 El usuario tiene experiencia en $skill');
    print('📱 Desarrollando con $skill - ${DateTime.now()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Estructura Principal con Scaffold
      appBar: AppBar(
        title: const Text(
          'Portafolio de Programador',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple, // Color personalizado
        elevation: 8,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Imagen de Perfil
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 180, 
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.deepPurple,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // 7. Superposición de Widgets (Stack)
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 3. Información del Usuario
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50, // Color de fondo
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
                border: Border.all(
                  color: Colors.deepPurple.shade200,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Julian David Almanza Sasa',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade800,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Desarrollador Flutter & UI/UX Designer\n'
                    'Apasionado por crear aplicaciones móviles innovadoras '
                    'con interfaces de usuario excepcionales. ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 4. Íconos de Redes Sociales
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      print('🌐 LinkedIn presionado');
                    },
                    icon: Icon(
                      Icons.linked_camera,
                      color: Colors.blue.shade700,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      print('🐙 GitHub presionado');
                    },
                    icon: Icon(
                      Icons.code,
                      color: Colors.grey.shade800,
                      size: 36,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      print('📷 Instagram presionado');
                    },
                    icon: Icon(
                      Icons.photo_camera,
                      color: Colors.pink.shade400,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 5. Habilidades del Usuario
            const Text(
              'Habilidades Técnicas',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: ElevatedButton(
                      onPressed: () => _onSkillPressed(skills[index]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getSkillColor(index),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        skills[index],
                        style: TextStyle(
                          fontSize: _getSkillFontSize(index),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),

            // 6. Cuadrícula de Fotos o Proyectos
            const Text(
              'Proyectos Destacados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: _getProjectColor(index),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Proyecto ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      // 8. Alineación de Texto (Align)
      bottomNavigationBar: Container(
        height: 50,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  'Versión 1.0',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para obtener colores diferentes para las habilidades
  Color _getSkillColor(int index) {
    final colors = [
      Colors.deepPurple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.pink,
      Colors.teal,
    ];
    return colors[index % colors.length];
  }

  // Método para obtener tamaños de fuente diferentes
  double _getSkillFontSize(int index) {
    final sizes = [14.0, 16.0, 15.0, 14.5, 16.5, 15.5, 14.0];
    return sizes[index % sizes.length];
  }

  // Método para obtener colores diferentes para los proyectos
  Color _getProjectColor(int index) {
    final colors = [
      Colors.deepPurple.shade400,
      Colors.blue.shade400,
      Colors.green.shade400,
      Colors.orange.shade400,
      Colors.red.shade400,
      Colors.pink.shade400,
    ];
    return colors[index % colors.length];
  }
}

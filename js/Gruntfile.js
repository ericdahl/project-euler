module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        jshint: {
            files: ['*.js']
        },
        execute: {
            simple_target_with_args: {
                options: {
                    args: [grunt.option('problem')]
                },
                src: ['run.js']
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-execute');

    grunt.registerTask('default', ['jshint']);
};

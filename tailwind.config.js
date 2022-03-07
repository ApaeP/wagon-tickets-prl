const { colors: defaultColors } = require('tailwindcss/defaultTheme')

const colors = {
    ...defaultColors,
    ...{

    },
}

module.exports = {
  content: ["./app/views/**/*.{html,html.erb}"],
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
    },
    colors: colors,
    auto: 'auto',
    boxShadow: {
      },
    fontFamily: {
      sans: ['"Roboto"', 'sans-serif'],
      main: ['"Comfortaa"', 'sans-serif']
    },
    screens: {
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px',
    },
    height: (theme) => ({
      ...theme('spacing'),
      '1/2': '50%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '5/6': '83.333333%',
      '15vh': '15vh',
      '25vh': '25vh',
      full: '100%',
      screen: '100vh',
    }),
    minWidth: {
    },
  },
  variants: {
    extend: {
      display: ["group-hover"]
    },
  },
  plugins: [],
}

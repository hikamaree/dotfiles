const CONFIG = {
  /**
   * The category, name, key, url, search path, color, icon, and quicklaunch properties for your commands.
   * Icons must be added to "icons" folder and their values/names must be updated.
   * If none of the specified keys are matched, the '*' key is used.
   * Commands without a category don't show up in the help menu.
   * Update line 11 and 13 if you prefer using Google.
   */
  commands: [{
      name: 'Brave',
      key: '*',
      url: 'https://search.brave.com/',
      search: '/?q={}'
    },
    {
      category: 'General',
      name: 'Mail',
      key: 'm',
      url: 'https://gmail.com',
      search: '/#search/text={}',
      icon: 'mail',
      quickLaunch: true,
    },
    {
      category: 'General',
      name: 'WhatsApp',
      key: 'w',
      url: 'https://web.whatsapp.com',
      icon: 'whatsapp',
      quickLaunch: false,
    },
    {
      category: 'General',
      name: 'Discord',
      key: 'd',
      url: 'https://discord.com/app',
      icon: 'discord',
      quickLaunch: false,
    },


    {
      category: 'Programming',
      name: 'GitHub',
      key: 'g',
      url: 'https://github.com',
      search: '/search?q={}',
      icon: 'github',
      quickLaunch: true,
    },
    {
      category: 'Programming',
      name: 'StackOverflow',
      key: 's',
      url: 'https://stackoverflow.com',
      search: '/search?q={}',
      icon: 'stackoverflow',
      quickLaunch: true,
    },
    {
      category: 'Programming',
      name: 'ArchWiki',
      key: 'a',
      url: 'https://archlinux.org/',
      icon: 'arch',
      quickLaunch: true,
    },


    {
      category: 'Fun',
      name: 'YouTube',
      key: 'y',
      url: 'https://youtube.com',
      search: '/results?search_query={}',
      icon: 'youtube',
      quickLaunch: false,
    },
    {
      category: 'Fun',
      name: 'Chess',
      key: 'c',
      url: 'https://chess.com',
      icon: 'chess',
      quickLaunch: false,
    },
    {
      category: 'Fun',
      name: 'Reddit',
      key: 'r',
      url: 'https://reddit.com',
      search: '/search?q={}',
      icon: 'reddit',
      quickLaunch: false,
    },
    

    {
      category: 'Other',
      name: 'Office',
      key: 'o',
      url: 'https://office.com',
      icon: 'office',
      quickLaunch: false,
    },
    {
      category: 'Other',
      name: 'CMC',
      key: 'cmc',
      url: 'https://coinmarketcap.com',
      icon: 'cmc',
      quickLaunch: false,
    },
    {
      category: 'Other',
      name: 'Moodle',
      key: 'mo',
      url: 'https://elearning.rcub.bg.ac.rs/moodle/',
      icon: 'moodle',
      quickLaunch: false,
    },
  ],

  /**
   * Get suggestions as you type.
   */
  suggestions: true,
  suggestionsLimit: 4,

  /**
   * The order and limit for each suggestion influencer. An "influencer" is
   * just a suggestion source. The following influencers are available:
   *
   * - "Commands" suggestions come from CONFIG.commands
   * - "Default" suggestions come from CONFIG.defaultSuggestions
   * - "DuckDuckGo" suggestions come from the duck duck go search api
   * - "History" suggestions come from your previously entered queries
   */
  influencers: [{
      name: 'Commands',
      limit: 2
    },
    {
      name: 'Default',
      limit: 4
    },
    {
      name: 'History',
      limit: 1
    },
    {
      name: 'DuckDuckGo',
      limit: 4
    },
  ],

  /**
   * Default search suggestions for the specified queries.
   */
  defaultSuggestions: {
    g: ['g/issues', 'g/pulls', 'gist.github.com'],
    r: ['r/r/unixporn', 'r/r/startpages', 'r/r/webdev', 'r/r/technology'],
  },

  /**
   * Instantly redirect when a key is matched. Put a space before any other
   * queries to prevent unwanted redirects.
   */
  instantRedirect: false,

  /**
   * Open triggered queries in a new tab.
   */
  newTab: false,

  /**
   * Dynamic overlay background colors when command domains are matched.
   */
  colors: true,

  /**
   * Invert color theme
   */
  invertedColors: false,

  /**
   * Show keys instead of icons
   */
  showKeys: false,

  /**
   * The delimiter between a command key and your search query. For example,
   * to search GitHub for potatoes, you'd type "g:potatoes".
   */
  searchDelimiter: ':',

  /**
   * The delimiter between a command key and a path. For example, you'd type
   * "r/r/unixporn" to go to "https://reddit.com/r/unixporn".
   */
  pathDelimiter: '/',

  /**
   * The delimiter between the hours and minutes on the clock.
   */
  clockDelimiter: ' ',

  /**
   * Show a twenty-four-hour clock instead of a twelve-hour clock with AM/PM.
   */
  twentyFourHourClock: false,

  /**
   * File extension for icon images
   */
  iconExtension: 'png'
};

# Workflower

## Project Deployment
### Target Platforms
Debian GNU/Linux-based distributions (Debian 8, Ubuntu 16 and its derivatives).

Workflower might work on other Linux platforms, but it's not guaranteed.

### Prerequisites
You'll need these stuff to run the project:
- **mongoDB** database server v3.4.3;
- **Node.js** JavaScript runtime v6.10.1 (LTS);
- **Ruby** v2.4.0 or higher;
- **Rails** Ruby framework v5.0.2 or higher;

### Gathering Workflower
As user, clone the project sources from this repository:
```ShellSession
  $ git clone https://github.com/therealdevelopers/workflower-backend.git
  $ cd workflower-backend
  $ bundle update
```

We also recommend to update the components:
```ShellSession
  $ bundle update
```

### Launching
Run `mongod` service:
```ShellSession
  $ sudo service mongod start
```

Then start the project from its directory:
```ShellSession
  $ rails server
```

By default, **Workflower** site pages is available on `http://localhost:3000`.
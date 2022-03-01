# Setup Restic for GitHub Actions
Setup [Restic](https://restic.net) on GitHub Actions to use `restic`.

This action installs [Restic](https://restic.net) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

With this action, you can now manipulate your restic repository on GitHub Actions.

## Usage
To use `restic`, run this action before `restic`.

1. Paste restic repository to `RESTIC_REPOSITORY` secret.
2. Paste restic repository password to `RESTIC_PASSWORD` secret.

```yaml
steps:
  - name: Setup Restic
    uses: AnimMouse/setup-restic@v1
    
  - run: restic check
    env:
      RESTIC_REPOSITORY: ${{ secrets.RESTIC_REPOSITORY }}
      RESTIC_PASSWORD: ${{ secrets.RESTIC_PASSWORD }}
```

### Environment variable based repositories
#### S3 example
1. Paste AWS access key ID to `AWS_ACCESS_KEY_ID` secret.
2. Paste AWS secret access key to `AWS_SECRET_ACCESS_KEY` secret.

```yaml
steps:
  - name: Setup Restic
    uses: AnimMouse/setup-restic@v1
    
  - run: restic check
    env:
      RESTIC_REPOSITORY: ${{ secrets.RESTIC_REPOSITORY }}
      RESTIC_PASSWORD: ${{ secrets.RESTIC_PASSWORD }}
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

#### B2 example
1. Paste B2 account ID to `B2_ACCOUNT_ID` secret.
2. Paste B2 account key to `B2_ACCOUNT_KEY` secret.

```yaml
steps:
  - name: Setup Restic
    uses: AnimMouse/setup-restic@v1
    
  - run: restic check
    env:
      RESTIC_REPOSITORY: ${{ secrets.RESTIC_REPOSITORY }}
      RESTIC_PASSWORD: ${{ secrets.RESTIC_PASSWORD }}
      B2_ACCOUNT_ID: ${{ secrets.B2_ACCOUNT_ID }}
      B2_ACCOUNT_KEY: ${{ secrets.B2_ACCOUNT_KEY }}
```

For other environment variable based repositories, you can use another variables, just follow the S3 and B2 examples.

### Rclone
You can use [AnimMouse/setup-rclone](https://github.com/AnimMouse/setup-rclone) in order to use Rclone on Restic.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - name: Setup Restic
    uses: AnimMouse/setup-restic@v1
    
  - run: restic check
    env:
      RESTIC_REPOSITORY: ${{ secrets.RESTIC_REPOSITORY }}
      RESTIC_PASSWORD: ${{ secrets.RESTIC_PASSWORD }}
```